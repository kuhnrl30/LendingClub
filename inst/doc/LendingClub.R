## ------------------------------------------------------------------------
library(LendingClub)

investorID<- Sys.getenv("id")
APIkey<- Sys.getenv("key")

MakeCredential(investorID, APIkey)

## ------------------------------------------------------------------------
Cash<- AvailableCash()
Cash

## ------------------------------------------------------------------------
Notes<- NotesOwned()
names(Notes)

