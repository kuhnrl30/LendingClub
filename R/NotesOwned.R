#' Return investor's loans
#'
#' Uses Lending Club's API to access the user's account and return the
#' notes owned by the investor
#' @export
NotesOwned<- function(){
    LC_CRED<-CheckCred()

    searchURL<- MakeURL(LC_CRED$investorID,"notes")

    LC_GET(searchURL, LC_CRED$key, margin=F)
    }
