#' Return investor's available cash
#'
#' Retrieves the available cash in the user's account. Cash 
#' commited to open buy orders is excluded from the total.
#'
#' @inheritParams lc_AccountSummary
#' @export
lc_AvailableCash<- function(LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- MakeURL(LC_CRED$investorID, "availablecash")

    LC_GET(searchURL, LC_CRED$key, margin=T)


    }
