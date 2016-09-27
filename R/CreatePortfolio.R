#' Create a new portfolio
#'
#' Create a new portfolio to assign loans to. Notes can be assigned to
#' a portfolio using the API when they are purhcased from the primary
#' market.
#'
#' @param port_name Name of the new portfolio
#' @param port_desc Portfolio description
#' @inheritParams AccountSummary
#' @export
CreatePortfolio<- function(port_name, port_desc, LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID,"portfolios")



    params<- list("aid" = LC_CRED$investorID,
                  "portfolioName" = port_name,
                  "portfolioDescription" = port_desc)

    LC_POST(postURL, params, LC_CRED$key)
}
