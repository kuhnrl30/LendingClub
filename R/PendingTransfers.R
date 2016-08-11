#' Return Investor's Pending Transfers
#'
#' Uses Lending Club's API to access the user's account and return the summary
#'
#' @export
PendingTransfers<- function(){

    LC_CRED<-CheckCred()

    searchURL<-MakeURL(LC_CRED$investorID, "funds/pending")

    r<- LC_GET(searchURL, LC_CRED$key)

    CleanData(r$transfers)
}
