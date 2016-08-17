## ------------------------------------------------------------------------
library(LendingClub)

investorID<- Sys.getenv("id")
APIkey<- Sys.getenv("key")

MakeCredential(investorID, APIkey)

## ------------------------------------------------------------------------
Loans<- ListedLoans()
dim(Loans$content)

## ------------------------------------------------------------------------
AccountSummary()

