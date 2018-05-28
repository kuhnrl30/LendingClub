#' Listing of investor's loans
#'
#' Access the user's account and return a dataframe of the investor's notes
#' owned.
#'
#' The \code{lc_DetailedNotesOwned)} function returns nearly
#' the same variables as \code{lc_NotesOwned()}. As the name suggests, the function
#' returns additional information about the notes owned including datapoints
#' on the purpose, portfolio, and the payment history.

#' @name lc_NotesOwned
#' @export
#' @inheritParams lc_AccountSummary
#'
#'
#'
lc_NotesOwned<- function(LC_CRED=NULL){
    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- MakeURL(LC_CRED$investorID,"notes")

    LC_GET(searchURL, LC_CRED$key, margin=F)
    }
