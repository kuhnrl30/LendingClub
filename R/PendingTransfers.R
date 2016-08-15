#' Return Investor's Pending Transfers
#'
#' Uses Lending Club's API to access the user's account and return the summary
#'
#' @export
PendingTransfers<- function(){

    LC_CRED<-CheckCred()

    searchURL<-MakeURL(LC_CRED$investorID, "funds/pending")

    LC_GET(searchURL, LC_CRED$key, margin=F)

    }
