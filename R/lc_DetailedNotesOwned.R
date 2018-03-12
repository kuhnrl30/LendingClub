#' @rdname NotesOwned
#' @export
#'
lc_DetailedNotesOwned<- function(LC_CRED=NULL){
    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- MakeURL(LC_CRED$investorID,"detailednotes")

    result<- LC_GET(searchURL, LC_CRED$key, margin=F)
    
    class(result)<- append("holdings", class(result))
    class(result$content)<- append("holdings", class(result$content))
    
    result

}
