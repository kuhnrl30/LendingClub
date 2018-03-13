# Lending Club  
[![Build Status](https://travis-ci.org/kuhnrl30/LendingClub.svg?branch=master)](https://travis-ci.org/kuhnrl30/LendingClub)
[![Coverage status](https://codecov.io/gh/kuhnrl30/lendingclub/branch/master/graph/badge.svg)](https://codecov.io/github/kuhnrl30/lendingclub?branch=master)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LendingClub)](https://cran.r-project.org/package=LendingClub)
<img src= "https://cranlogs.r-pkg.org/badges/grand-total/LendingClub" />
[![DOI](https://zenodo.org/badge/65163868.svg)](https://zenodo.org/badge/latestdoi/65163868)


## A package built to access the Lending Club API  
This package helps you make transactions and manage the funds in your Lending Club account. 
The functions can be grouped as: Account Management, Transferring Funds, and 
Transacting Loans.

## Installation
You can install the stable version on CRAN:
```
install.packages("LendingClub")
library(LendingClub)
```

Or use devtools to install the development version from Github:
```
devtools::install_github("kuhnrl30/LendingClub")
library(LendingClub)
```

## Usage 
To use this package, you'll first need to create a credential from your account 
number and API key. This credential can be saved to the global environment and 
the other functions will automatically detect it. Use the lc_MakeCredential() function and pass 
it your investorID number and your API key. You can find the InvestorID on your 
account summary page and the API key on the Account Settings page. 

```
LC_CRED<- lc_MakeCredential(investorID, APIkey)
lc_ListedLoans()
lc_AccountSummary()
```

## Credits
This packages is powered by:
- [httr](http://httr.r-lib.org/)
- [knitr](https://yihui.name/knitr/)
- [jsonlite](https://arxiv.org/abs/1403.2805)
- [dplyr](http://dplyr.tidyverse.org/)

## License
This package is free and open source software, licensed under MIT.
