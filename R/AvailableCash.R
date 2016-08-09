#' Return Investor's available cash
#'
#' Uses Lending Club's API to access the user's account and return the available
#'  cash.
#'
#' @param investorID Investor's ID number from the Account Summary page
#' @param key Investor's API key. See the Account Settings page
#' @export
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @export
AvailableCash<- function(){

    LC_CRED<-CheckCred()

    base<-"https://api.lendingclub.com/api/investor/v1/accounts/"
    searchURL<- paste0(base,LC_CRED$investorID,"/availablecash")


    r<- LC_GET(searchURL, LC_CRED$key)
    r$availableCash

    }
