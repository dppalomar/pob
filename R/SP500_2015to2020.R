#' Daily price data of the S&P 500 index and its constituent stocks from 2015 to 2020.
#'
#' @description Daily close data downloaded from Yahoo!Finance and cleaned with package `imputeFin` (for missing values and outliers).
#' All the data is adjusted for splits & dividends.
#' See Wikipedia (https://en.wikipedia.org/wiki/List_of_S&P_500_companies) for information on the constituent stocks of the S&P 500.
#'
#' @docType data
#'
#' @usage data(SP500_2015to2020)
#'
#' @format List with the following elements:
#' \describe{
#'   \item{stocks}{An `xts` object from 2015 to 2020 with daily close prices of 471 stocks.}
#'   \item{index}{An `xts` object from 2015 to 2020 with daily close prices of the S&P500 index.}
#' }
#'
#' @source Yahoo!Finance
#'
#' @keywords datasets
#'
"SP500_2015to2020"
