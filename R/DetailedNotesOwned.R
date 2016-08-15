#' Return detail on investor's loans
#'
#' Uses Lending Club's API to access the user's account and return
#' detail on the notes owned by the investor
#' @export
DetailedNotesOwned<- function(){
    LC_CRED<-CheckCred()

    searchURL<- MakeURL(LC_CRED$investorID,"detailednotes")

    LC_GET(searchURL, LC_CRED$key, margin=F)

}
