#' Buy a note
#'
#' Create an order to purchase a note. If the account has sufficient
#' funding, the note will be purchased once the loand has passed
#' through the funding stage.
#'
#' @param loanId Unique ID for loans. These can be found using the
#' ListedLoans() function.
#' @param amount Amount to be purchased
#' @param portfolioId Unique ID for the portfolio. It can be found
#' using the PortfoliosOwned() function.
#' @inheritParams AccountSummary
#' @export

SubmitOrder<- function(loanId, amount, portfolioId=NULL, LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID,"orders")


    params<- list("aid" = LC_CRED$investorID,
                  "loanId" = loanId,
                  "requestedAmount" = amount,
                  "portfolioId" = portfolioId)


    LC_POST(postURL, params, LC_CRED$key)
}
