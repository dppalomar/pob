
<!-- README.md is generated from README.Rmd. Please edit that file -->



# Repository pob
This is a supporting package for the [Portfolio Optimization](https://www.danielppalomar.com/teaching-courses/fall-2022-23-mafs5310-portfolio-optimization-with-r/) course notes. It contains data, slides, exercises, and code examples (R and Python).

To install in R:

```r
devtools::install_github("dppalomar/pob")
```

To install in Python:

```r
# TBD
```


### Data
The package contains stock data and cryptocurrency data:

```r
library(pob)

# stock S&P500 market data
data(SP500_2015to2020)
names(SP500_2015to2020)
#> [1] "stocks" "index"
head(SP500_2015to2020$stocks[, 1:5])
#>            A     AAL     AAP   AAPL    ABBV
#> [1,] 37.7523 51.0467 154.217 24.239 50.8722
#> [2,] 37.1642 50.2556 154.108 24.241 50.6204
#> [3,] 37.6574 50.2272 157.420 24.581 52.6663
#> [4,] 38.7862 50.8430 158.800 25.526 53.2171
#> [5,] 38.5016 49.2891 157.991 25.553 51.7614
#> [6,] 38.0463 46.9772 156.641 24.923 51.7457

# crypto data
data(cryptos_2017to2021)
names(cryptos_2017to2021)
#> [1] "daily"  "hourly"
head(cryptos_2017to2021$hourly[, 1:5])
#>           BTC      ETH       ADA       DOT       XRP
#> [1,] 37485.61 1204.525 0.3309979 10.005659 0.3051329
#> [2,] 37040.38 1183.403 0.3085464  9.677910 0.3237329
#> [3,] 37806.57 1201.001 0.3119042  9.823281 0.3579904
#> [4,] 37936.25 1227.162 0.3179058  9.966991 0.3364566
#> [5,] 38154.69 1218.127 0.3185917  9.882065 0.3285119
#> [6,] 38441.49 1223.862 0.3156046  9.785281 0.3412451
```


### Slides
TBD


### Exercises

- Chapter 11 - Risk Parity Portfolio: [exercises](exercises/ch11-exercises.pdf)
    
- Appendix A - Convex Optimization Theory: [exercises](exercises/appA-exercises.pdf)

- Appendix B - Optimization Algorithms
  + [exercices](exercises/appB-exercises.pdf)




### Code examples

- Chapter 6 - Portfolio Basics
  + [R code](https://raw.githack.com/dppalomar/pob/master/code_examples/R/ch6-R.html)
  + Python code: TBD
  
- Chapter 7 - Modern Portfolio Theory
  + [R code](https://raw.githack.com/dppalomar/pob/master/code_examples/R/ch7-R.html)
  + Python code: TBD

  
