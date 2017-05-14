#' Buy a note on the primary market
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
#' @param quiet Should the response be printed to the console
#' @inheritParams AccountSummary
#' @examples
#' \dontrun{
#' SubmitOrder(12345678, 25)
#' SubmitOrder(12345678, 25, "myPortfolio")
#' 
#' #For multiple loans in a single order
#' SubmitOrder(loanId=c(123, 456, 789), amount= c(rep(25,3)))
#'}
#' @export

SubmitOrder<- function(loanId, amount, portfolioId=NULL, LC_CRED=NULL, quiet=T){

    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID,"orders")

    orders<- data.frame("loanId" = loanId,
                        "requestedAmount" = amount)

    if(!is.null(portfolioId)) {
        orders<- as.data.frame(cbind(orders, portfolioId),
                               stringsAsFactors=F)
        }

    params<- list("aid" = LC_CRED$investorID,
                 "orders"= orders)

    resp<- LC_POST(postURL, params, LC_CRED$key)
    
    
    if (!quiet && !is.null(resp$executionStatus)) {
        d<- resp$executionStatus
        cbind(as.data.frame(t(sapply(d, function(x) x[1:3]))),
              executionStatus= sapply(d, function(x) paste0(x$executionStatus, collapse=", "))) 
    }
}
