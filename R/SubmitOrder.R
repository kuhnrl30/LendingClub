#' Order a note
#'
#' Uses Lending Club's API to create an order to purchase a note
#' @param loanId unique ID for loans. These can be found using the
#' ListedLoans() function.
#' @param amount amount to be purchased
#' @param portfolioId unique ID for the portfolio. It can be found
#' using the PortfoliosOwned() function.
#' @export

SubmitOrder<- function(loanId, amount, portfolioId){

    LC_CRED<-CheckCred()

    postURL<- MakeURL(LC_CRED$investorID,"orders")


    params<- list("aid" = LC_CRED$investorID,
                  "loanId" = loanId,
                  "requestedAmount" = amount,
                  "portfolioId" = portfolioId)


    LC_POST(postURL, params, LC_CRED$key)
}
