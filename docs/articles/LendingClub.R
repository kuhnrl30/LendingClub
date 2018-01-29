## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(eval=F)

## ------------------------------------------------------------------------
#  library(LendingClub)
#  
#  investorID<- Sys.getenv("id")
#  APIkey    <- Sys.getenv("key")
#  
#  LC_CRED<- MakeCredential(investorID, APIkey)

## ------------------------------------------------------------------------
#  ListedLoans()

## ------------------------------------------------------------------------
#  AccountSummary_()

## ---- eval=FALSE---------------------------------------------------------
#  LC_CRED<- MakeCredential(investorID, APIkey)
#  
#  # Establish a limt on how many loans are in the order
#  # by determing the max amount of $25 notes you can purchase.
#  notequantity<- as.numeric(AvailableCash()$content[2, 2]) %/% 25
#  
#  
#  loans<- ListedLoans()$content$loans
#  
#  # Filter, sort, or apply your model to determine where to invest.
#  order<- loans %>%
#    filter(grade %in% c("A", "B")) %>%
#    sort(desc(intRate)) %>%
#    select(id) %>%
#    head(notequantity)
#  
#  SubmitOrder(loanId= order,
#              amount= rep(25, notequantity),
#              LC_CRED= LC_CRED)

