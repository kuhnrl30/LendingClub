#' Return Investor's Pending Transfers
#'
#' Uses Lending Club's API to access the user's account and return the summary
#' @inheritParams AccountSummary
#' @export
PendingTransfers<- function(LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<-MakeURL(LC_CRED$investorID, "funds/pending")

    LC_GET(searchURL, LC_CRED$key, margin=F)

    }
