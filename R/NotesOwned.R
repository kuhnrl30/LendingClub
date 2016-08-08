#' Return investor's loans
#'
#' Uses Lending Club's API to access the user's account and return the
#' notes owned by the investor
#' @export
NotesOwned<- function(){
    LC_CRED<-CheckCred()

    base<-"https://api.lendingclub.com/api/investor/v1/accounts/"
    searchURL<- paste0(base,LC_CRED$investorID,"/notes")

    response<- httr::GET(searchURL,
                         httr::add_headers("Authorization"= LC_CRED$key))
    dat<- httr::content(response)
    CleanNoteData(dat)
}
