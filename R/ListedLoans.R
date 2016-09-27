#' Loan Listing
#'
#' Uses Lending Club's API to return all current listed loans
#' @param showAll logical, indicate whether all loans should be retured.
#' Use false to limit the results to those loans listed in the most recent
#' listing period.
#' @inheritParams AccountSummary
#' @export
ListedLoans<- function(showAll=TRUE, LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- "https://api.lendingclub.com/api/investor/v1/loans/listing"

    x<-LC_GET(searchURL, LC_CRED$key,  query=list("showAll" = showAll), margin=NULL)

    y<- t(data.frame(do.call(cbind, x$content[[2]]), stringsAsFactors = F))
    row.names(y)<-NULL
    x$content<- data.frame(y)
    x

}
