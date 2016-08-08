#' Create the Lending Club credential
#'
#' Creates the credential needed to access the other functions in this package.
#' This is the first step.
#' @param investorID User's ID from the Account Summary page
#' @param APIkey User's API key from the account settings page
#' @export
MakeCredential<- function(investorID, APIkey){
    cred<- list("investorID"=investorID,
                "key"=APIkey)

    assign("LC_CRED",cred,envir=.GlobalEnv)
}
