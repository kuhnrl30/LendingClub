#' Return Investor's Account Summary
#'
#' Uses Lending Club's API to access the user's account and return the summary
#'
#' @param investorID Investor's ID number from the Account Summary page
#' @param key Investor's API key. See the Account Settings page
#' @export
AccountSummary<- function(){

    LC_CRED<-CheckCred()

    searchURL<-MakeURL(LC_CRED$investorID, "summary")

    LC_GET(searchURL, LC_CRED$key)

}
