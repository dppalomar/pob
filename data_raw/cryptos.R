library(xts)
library(lubridate)
library(cryptodata)
help(package = "cryptodata")

data(cryptodata_xxxusdt_period_1hour)
data(cryptodata_xxxbtc_period_1hour)

# with_tz(now(), "UTC")
# with_tz("2021-01-07 09:00:00 HKT", "UTC")
from_timedate <- "2021-01-07 09:00:00 HKT"

coin_names <- c("BTC", "ETH", "ADA", "DOT", "XRP", "UNI", "LTC", "THETA", "LINK", "BCH", "FIL", "XLM", "WBTC", "LUNA", "DOGE",
                "VET", "CRO", "BTT", "TRX", "SOL", "AAVE", "KSM", "XMR", "ATOM", "EOS", "BSV", "FTT", "AVAX", "XTZ", "ALGO",
                "XEM", "NEO", "CHZ", "HOT", "HT", "HBAR", "DCR", "DASH", "GRT", "ENJ", "MKR", "NEAR", "ZIL", "COMP",
                "SNX", "SUSHI", "MATIC", "ICX", "ZEC", "ONE", "BAT", "MANA", "RVN", "ETC", "NEXO", "ZRX", "UMA", "YFI",
                "BNT", "ONT", "WAVES", "RSR", "SC", "ANKR", "FLOW", "REN", "DGB", "OMG", "CKB", "AR", "IOST", "QTUM", "CRV",
                "LSK", "STORJ", "BTG", "1INCH", "XVG", "LRC", "GLM", "NANO", "KNC", "ZKS", "ZEN", "SAND")
spot_names_btc <- cryptotrading::coin_to_spotpair_names(coin_names, base_crypto = "BTC")
spot_names_usdt <- c("btcusdt", "ethusdt", "etcusdt", "ltcusdt", "bchusdt", "eosusdt", "xrpusdt", "trxusdt", "bsvusdt")

prices_hourly_btc  <- extract_OHLC_xts_list(cryptodata_xxxbtc_period_1hour, symbols = spot_names_btc[-1], na.rm = FALSE,
                                            from = from_timedate)$close
prices_hourly_btc <- cbind("btcbtc" = 1, prices_hourly_btc)

prices_hourly_usdt_orig <- extract_OHLC_xts_list(cryptodata_xxxusdt_period_1hour, symbols = spot_names_usdt, na.rm = FALSE)$close
btcusdt <- prices_hourly_usdt_orig[paste0(from_timedate, "::"), "btcusdt"]


prices_hourly_usdt <- prices_hourly_btc * as.vector(btcusdt)
colnames(prices_hourly_usdt)      <- cryptotrading::spotpair_to_coin_names(colnames(prices_hourly_usdt), base_crypto = "BTC")
colnames(prices_hourly_usdt_orig) <- cryptotrading::spotpair_to_coin_names(colnames(prices_hourly_usdt_orig), base_crypto = "USDT")

# sanity check after btc to usdt conversion
#plot(cbind(prices_hourly_usdt_orig[, "ethusdt"], prices_hourly_usdt[, "ETH"]))
all.equal(as.vector(prices_hourly_usdt_orig[paste0(from_timedate, "::"), "ETH"]), as.vector(prices_hourly_usdt[, "ETH"]))

# clean of NAs
columns_with_na <- apply(prices_hourly_usdt, 2, anyNA)
prices_hourly_usdt <- prices_hourly_usdt[, !columns_with_na]
anyNA(prices_hourly_usdt)
str(prices_hourly_usdt)

# final plot of hourly prices
plot(prices_hourly_usdt)


# get daily prices
idx_end_day <- endpoints(prices_hourly_usdt, on = "days")
prices_daily_usdt <- prices_hourly_usdt[idx_end_day, ]
tclass(prices_daily_usdt) <- "Date"

idx_end_day <- endpoints(prices_hourly_usdt_orig, on = "days")
prices_daily_usdt_orig <- prices_hourly_usdt_orig[idx_end_day, ]
tclass(prices_daily_usdt_orig) <- "Date"

# # get data from Yahoo!Finance
# btc_prices <- Ad(getSymbols("BTC-USD", from = "2017-01-01", auto.assign = FALSE))

cryptos_2017to2021 <- list(daily  = prices_daily_usdt_orig,
                           hourly = prices_hourly_usdt)


save(cryptos_2017to2021, file = "data/cryptos_2017to2021.RData", version = 2)
