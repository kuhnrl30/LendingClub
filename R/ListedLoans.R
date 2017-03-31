#' Listing of all loans on the primary market
#'
#' Uses Lending Club's API to return all current listed loans
#'
#' @param showAll logical, indicate whether all loans should be retured.
#' Use false to limit the results to those loans listed in the most recent
#' listing period.
#'
#'  @return LendingClub_api object.  There are two components, the first is
#' the content of the request, the second is the response from the API.
#' The content can be further subdivided into a 2 element list. The first
#' element is the date of the request and second is a dataframe of the
#' listed loans.
#'
#' @inheritParams AccountSummary
#' @export
ListedLoans<- function(showAll=TRUE, LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- "https://api.lendingclub.com/api/investor/v1/loans/listing"

    LC_GET(searchURL, LC_CRED$key,  query=list("showAll" = showAll), margin=NULL)

}
