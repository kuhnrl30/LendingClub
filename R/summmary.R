#' Prepare a dashboard of key metrics
#'
#' Creating a summary of matrics an investor would find useful in evaluating their 
#' account.   
#' 
#' At Risk Ratio calculates the percentage of the loans with principal 16 or more days late. 
#' 
#' @param object data.frame of loans from DetailedNotesOwned()
#' @param ... currently not used
#' @export
#' @examples 
#' \dontrun{
#' summary( DetailedNotesOwned( LC_CRED ))
#' 
#' # split notes a variable and  run summary for each subset
#' holdings<- DetailedNotesOwned(LC_CRED)$content
#' x<- lapply(split(holdings, f= a$portfolioName), summary)
#' y<- Reduce(function(...) merge(..., by= 'col_labs',  all.x=TRUE), x)
#' names(y)[-1]<- names(x)
#' y
#' }


summary.holdings<- function(object, ...) {
    
    if ("content" %in% names(object)){
        object<- object$content
        }
    
    col_labs<- c(
        "Amount Invested",
        "Discount",
        "Charged Off",
        "Principal Received",
        "Net Outstanding",
        "Interest Received",
        "Payments Received",
        "Wgt Int Rate",
        "At Risk Ratio")
    
    at_risk_status<- c("Late (16-30 days)",
                       "Late (31-120 days)",
                       "Charged Off")
    vals<- c( 
        sum(as.numeric(object$noteAmount)), # Amount Invested
        sum(as.numeric(object$principalReceived) + as.numeric(object$principalPending) - as.numeric(object$noteAmount)), # Discount
        -sum(as.numeric(object[object$loanStatus=="Charged Off","principalPending"]), na.rm=T), #Charged off
        -sum(as.numeric(object$principalReceived)),  # Principal received
        sum(as.numeric(object[!object$loanStatus=="Charged Off","principalPending"]), na.rm=T), # net outstanding
        sum(as.numeric(object$interestReceived)), 
        sum(as.numeric(object$paymentsReceived)), 
        round( sum(as.numeric(object$interestRate) * as.numeric(object$principalPending)) / sum(as.numeric(object$principalPending)), 2),
        round(sum(as.numeric(object$noteAmount[object$loanStatus %in% at_risk_status]))  / sum(as.numeric(object$noteAmount)-as.numeric(object$principalReceived))*100,2)
    )
    
    data.frame(col_labs, vals)
    
}
