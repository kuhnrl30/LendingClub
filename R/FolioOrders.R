#' Folio orders submitted in the current month
#'
#' View either buy or sell orders placed in the current month
#' @md
#' @inheritParams AccountSummary
#' @param includeDetails Include note level details
#' @param orderType Return 'buy' or 'sell' orders
#' @param status Used to filter results. Can be NULL or one of 9 possible status:
#' - IN_LISTING	
#'  - SETTLED	
#'  - CANCELED_BY_SELLER	
#'  - CANCELED_TIME_EXPIRED	
#'  - PENDING_TRADE_SETTLEMENT	
#'  - CANCELED_BY_PAYMENT
#'  - CANCELED_BY_DEFAULT_OR_CHARGE_OFF	
#'  - REPRICED
#'  - CANCELED_BY_BANKRUPTCY
#' @export

FolioOrders<- function(includeDetails=TRUE, orderType, status=NULL, LC_CRED=NULL){
    
    # check inputs
    if (!is.null(status)) {
        if (!(status %in% c("IN_LISTING",
                            "SETTLED",	
                            "CANCELED_BY_SELLER",
                            "CANCELED_TIME_EXPIRED",
                            "PENDING_TRADE_SETTLEMENT",
                            "CANCELED_BY_PAYMENT",
                            "CANCELED_BY_DEFAULT_OR_CHARGE_OFF",
                            "REPRICED",	
                            "CANCELED_BY_BANKRUPTCY"))) {
            stop("status type is not valid")
        }}
        
    if (!(is.logical(includeDetails))) stop("includeDetails is not logical")
    if (!(orderType %in% c("BUY", "SELL"))) stop("orderType should be one of 'BUY' or 'SELL'")
    
    LC_CRED<-CheckCred(LC_CRED)
    
    searchURL<- paste0("https://api.lendingclub.com/api/investor/v1/secondarymarket/accounts/",
                     LC_CRED[[1]],
                     "/orders")

    r<- httr::GET(searchURL,
               query=list("includeDetails"= includeDetails,
                          "orderType"= orderType),
               httr::add_headers("Authorization"= LC_CRED[[2]]))


    parsed<- httr::content(r,
                  as= "parsed",
                  encoding ='UTF-8')
    
    df<- as.data.frame(t(sapply(parsed, unlist)))
    names(df)<-gsub("note.","", names(df), fixed=T)
    df
    
}