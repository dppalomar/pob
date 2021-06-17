library(xts)
library(portfolioBacktestData)
help(package = "portfolioBacktestData")

data(SP500_Bloomberg)

close_prices <- SP500_Bloomberg$close["2015-01-04::"]
index_prices <- SP500_Bloomberg$index["2015-01-04::"]

#rows_with_na <- apply(close_prices, 1, anyNA)
#columns_with_na <- apply(close_prices, 2, anyNA)

idx_mask <- !apply(close_prices, 2, anyNA)
close_prices <- close_prices[, idx_mask]

anyNA(close_prices)
anyNA(index_prices)

colnames(close_prices)
head(close_prices[, "AAPL"])

SP500_2015to2020 <- list(stocks = close_prices,
                         index  = index_prices)

save(SP500_2015to2020, file = "data/SP500_2015to2020.RData", version = 2)
