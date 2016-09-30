#' Return the Investor's Account Summary
#'
#' Access the user's account and return the summary data.  The data points
#' include available cash, total account balance, and the number of notes in the
#' portfolio.
#'
#' @param LC_CRED Credential object having class LendingClub_credential. This object can be created using the \code{MakeCredential()} function. You can pass the object directly as an argument to the function or alternatively, it can be read from the global environment if it was stored as "LC_CRED".
#'
#' @export
AccountSummary<- function(LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<-MakeURL(LC_CRED$investorID, "summary")

    LC_GET(searchURL, LC_CRED$key, margin=T)

    }
