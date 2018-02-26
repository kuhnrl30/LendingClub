#' Transact with the secondary market
#'
#' Buy or sell notes on the FOLIOfn secondary market
#' @md
#' @inheritParams AccountSummary_
#' @param noteId The loan's note ID
#' @param expireDate The date the sell offer will expire. Can be as short as the
#' current date or up to 7 days from posting the offer. Character string.
#' @param Price Price you wish to sell your loan for. Remember to consider
#' @param quiet Should the API response be printed to the console
#' the accrued interest in your offering.
#' @param loanId **_Deprecated_**.  As of Jan 2018, the folio API was revised and the loan ID is no longer required.
#' @param orderId **_Deprecated_**.  As of Jan 2018, the folio API was revised and the order ID is no longer required.#' @inheritParams AccountSummary
#' @export
#'


FolioSell<- function(loanId= NULL, orderId= NULL, noteId, expireDate= NULL, Price=NULL, LC_CRED=NULL, quiet= T){
    
    #check for deprecated variables
    calls <- names(sapply(match.call(), deparse))[-1]
    if(any("loanId" %in% calls)) warning("The loanId variable is deprecated")
    if(any("orderId" %in% calls)) warning("The orderId variable is deprecated")
    
    LC_CRED<-CheckCred(LC_CRED)

    if(is.null(expireDate)){
        expireDate<- as.character(format(as.Date(Sys.time())+5,"%m/%d/%Y"))
        }

    postURL<- paste0("https://api.lendingclub.com/api/investor/v1/secondarymarket/accounts/",
                     LC_CRED[[1]],
                     "/orders")

    params<- data.frame("noteId"= noteId,
                        "price"= Price,
                        "orderType"= "SELL",
                        "expirationDate"= expireDate,
                        stringsAsFactors = F)

    resp<- LC_POST(postURL,params, LC_CRED$key)

    if (!quiet) {
        data.frame(do.call("cbind", resp[[1]]), stringsAsFactors = F)
    }
    
    }
