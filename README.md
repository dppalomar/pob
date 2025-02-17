<!-- README.md is generated from README.Rmd. Please edit that file -->

# Data repository pob

This is a data supporting package for the [Portfolio Optimization
Book](https://portfoliooptimizationbook.com), with the [developer GitHub
webpage](https://github.com/portfoliooptimizationbook).

For additional material, such as slides, exercises, and code examples (R
and Python), please check <https://portfoliooptimizationbook.com>

To install in R:

``` r
devtools::install_github("dppalomar/pob")
```

To install in Python:

``` python
pip install "git+https://github.com/dppalomar/pob.git#subdirectory=python"
```

### Loading data

The package contains S&P 500 stock data and cryptocurrency data.

To load data in R:

``` r
library(pob)

# stock S&P500 market data
data(SP500_2015to2020)
names(SP500_2015to2020)
head(SP500_2015to2020$stocks[, 1:5])

# crypto data
data(cryptos_2017to2021)
names(cryptos_2017to2021)
head(cryptos_2017to2021$hourly[, 1:5])
```

To load data in Python:

``` python
from pob_python import SP500_stocks_2015to2020, cryptos_2017to2021_daily

# Access S&P 500 components
print(SP500_stocks_2015to2020.columns)
print(SP500_stocks_2015to2020.head())

# Access crypto data
print(cryptos_2017to2021_daily.columns)
print(cryptos_2017to2021_daily.head())
print(cryptos_2017to2021_daily['BTC'])
print(cryptos_2017to2021_daily['ETH'])
```
