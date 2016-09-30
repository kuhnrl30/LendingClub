#' @rdname NotesOwned
#' @export
#'
DetailedNotesOwned<- function(LC_CRED=NULL){
    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- MakeURL(LC_CRED$investorID,"detailednotes")

    LC_GET(searchURL, LC_CRED$key, margin=F)

}
