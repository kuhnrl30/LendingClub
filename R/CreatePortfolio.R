#' Create a new portfolio
#'
#' Uses Lending Club's API to create a new portfolio
#' @export
CreatePortfolio<- function(port_name, port_desc){
    LC_CRED<-CheckCred()

    postURL<- MakeURL(LC_CRED$investorID,"portfolios")



    params<- list("aid" = LC_CRED$investorID,
                  "portfolioName" = port_name,
                  "portfolioDescription" = port_desc)

    LC_POST(postURL, params, LC_CRED$key)
}
