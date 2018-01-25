#' Create a new portfolio
#'
#' Create a new portfolio to assign loans to. Notes can be assigned to
#' a portfolio using the API when they are purhcased from the primary
#' market.
#'
#' @param port_name String. Name of the new portfolio
#' @param port_desc String. Portfolio description
#' @param quiet Should the response be printed to the console
#' @inheritParams AccountSummary
#' @export
CreatePortfolio<- function(port_name, port_desc, LC_CRED=NULL, quiet=T){

    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID,"portfolios")



    params<- list("actorId" = LC_CRED$investorID,
                  "portfolioName" = port_name,
                  "portfolioDescription" = port_desc)

    resp<- LC_POST(postURL, params, LC_CRED$key)
    
    if (!quiet && !is.null(resp$errors)) {
        message(sapply(resp$errors, function(x) x$message))
        }
    }
