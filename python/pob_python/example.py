from pob_python import SP500_stocks_2015to2020, cryptos_2017to2021_daily

# Access S&P 500 components
print(SP500_stocks_2015to2020.columns)
print(SP500_stocks_2015to2020.head())

# Access crypto data
print(cryptos_2017to2021_daily.columns)
print(cryptos_2017to2021_daily.head())
print(cryptos_2017to2021_daily['BTC'])
print(cryptos_2017to2021_daily['ETH'])
