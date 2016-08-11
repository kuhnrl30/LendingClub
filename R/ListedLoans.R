#' Loan Listing
#'
#' Uses Lending Club's API to return all current listed loans
#' @export
ListedLoans<- function(){

    LC_CRED<-CheckCred()

    searchURL<- "https://api.lendingclub.com/api/investor/v1/loans/listing"

    r<- LC_GET(searchURL, LC_CRED$key)

    CleanData(r$loans)
}
