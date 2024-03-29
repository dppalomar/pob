##
## User installation
##
# Local installation
install.packages(file.choose(), repos = NULL, type="source")
# Getting help
library(pob)
help(package = "pob")
?SP500_2015to2020
?cryptos_2017to2021
#tools::showNonASCIIfile("R/SP500_2015to2020.R")


##
## Developer commands (https://r-pkgs.org/)
##
devtools::load_all()  #or Ctrl-Shift-L
devtools::document()  #to generate all documentation via roxygen
devtools::install()
library(pob)


# Code tests
devtools::test()
#covr::package_coverage()  #coverage of tests


# generate tarball
#R CMD build .


# GitHub related:
# To see people who starred: https://github.com/dppalomar/pob/stargazers
# To see people who are watching: https://github.com/dppalomar/pob/watchers
