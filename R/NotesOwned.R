#' Return investor's loans
#'
#' Uses Lending Club's API to access the user's account and return the
#' notes owned by the investor
#' @inheritParams AccountSummary
#' @export
NotesOwned<- function(LC_CRED=NULL){
    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- MakeURL(LC_CRED$investorID,"notes")

    LC_GET(searchURL, LC_CRED$key, margin=F)
    }
