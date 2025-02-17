library(xts)
library(pob)

data(SP500_2015to2020)


stocks_df <- data.frame(
  Date = index(SP500_2015to2020$stocks),
  coredata(SP500_2015to2020$stocks)
)
saveRDS(stocks_df, file = "python/data/SP500_2015to2020_stocks.rds")


stocks_df <- data.frame(
  Date = index(SP500_2015to2020$index),
  coredata(SP500_2015to2020$index)
)
saveRDS(stocks_df, file = "python/data/SP500_2015to2020_index.rds")


stocks_df <- data.frame(
  Date = index(cryptos_2017to2021$daily),
  coredata(cryptos_2017to2021$daily)
)
saveRDS(stocks_df, file = "python/data/cryptos_2017to2021_daily.rds")


stocks_df <- data.frame(
  Date = index(cryptos_2017to2021$hourly),
  coredata(cryptos_2017to2021$hourly)
)
saveRDS(stocks_df, file = "python/data/cryptos_2017to2021_hourly.rds")
