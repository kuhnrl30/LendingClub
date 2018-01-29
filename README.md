# Lending Club  
[![Build Status](https://travis-ci.org/kuhnrl30/LendingClub.svg?branch=master)](https://travis-ci.org/kuhnrl30/LendingClub)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LendingClub)](https://cran.r-project.org/package=LendingClub)
<img src= "https://cranlogs.r-pkg.org/badges/grand-total/LendingClub" />


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
the other functions will detect it. Use the MakeCredential() function and pass 
it your investorID number and your API key. You can find the InvestorID on your 
account summary page and the API key on the Account Settings page. 

```
LC_CRED<- MakeCredential(investorID, APIkey)
ListedLoans()
AccountSummary_()
```

## License
This package is free and open source software, licensed under MIT.
