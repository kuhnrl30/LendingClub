#' Return detail on investor's loans
#'
#' Get a detailed listing of notes owned by the investor.
#'
#'
#' @inheritParams AccountSummary
#' @export
DetailedNotesOwned<- function(LC_CRED=NULL){
    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- MakeURL(LC_CRED$investorID,"detailednotes")

    LC_GET(searchURL, LC_CRED$key, margin=F)

}
