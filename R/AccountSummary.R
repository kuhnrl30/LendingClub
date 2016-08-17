#' Return Investor's Account Summary
#'
#' Uses Lending Club's API to access the user's account and return the summary
#' @export
AccountSummary<- function(){

    LC_CRED<-CheckCred()

    searchURL<-MakeURL(LC_CRED$investorID, "summary")

    LC_GET(searchURL, LC_CRED$key, margin=T)

    }
