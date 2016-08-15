#' Return Investor's available cash
#'
#' Uses Lending Club's API to access the user's account and return the available
#' cash.
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @export
AvailableCash<- function(){

    LC_CRED<-CheckCred()

    searchURL<- MakeURL(LC_CRED$investorID, "availablecash")

    LC_GET(searchURL, LC_CRED$key, margin=T)


    }
