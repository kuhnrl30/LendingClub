#' Create the Lending Club credential
#'
#' Creates the credential needed to access the other functions in this
#'  package.
#'
#' This is the first step to accessing the API. Pass the function
#' your investor ID and API key.  The investor ID can be found on your
#' account summary page and the API Key can be found on your account
#' settings page. The function will create an object of class
#' LendingClub_credential. If the credential is stored to the variable
#' LC_CRED, then the other functions in the package will be able to
#' read the credential from the global environment.  Else, you may
#' pass the credential to the other functions as an argument.
#'
#' @examples
#' LC_CRED<- MakeCredential("investorID", "APIkey")
#'
#' @param investorID User's ID from the Account Summary page
#' @param APIkey User's API key from the account settings page
#' @param ... See the details section for more information.
#' @export
MakeCredential<- function(investorID, APIkey){

    # Create the credential
    structure(
        list("investorID"= investorID,
             "key"= APIkey),
        class = "LendingClub_credential")

    }
