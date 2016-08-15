#' List investor's portfolios
#'
#' Provides a dataframe of all portfolios owned by the investor.
#' @export
PortfoliosOwned<- function(){

    LC_CRED<-CheckCred()

    searchURL<- MakeURL(LC_CRED$investorID,"portfolios")

    LC_GET(searchURL, LC_CRED$key, margin = F)

    }
