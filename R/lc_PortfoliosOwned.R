#' Listing of investor's portfolios
#'
#' Provides a dataframe of all portfolios owned by the investor.
#' @inheritParams lc_AccountSummary
#' @export
lc_PortfoliosOwned<- function(LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<- MakeURL(LC_CRED$investorID,"portfolios")

    LC_GET(searchURL, LC_CRED$key, margin = F)

    }
