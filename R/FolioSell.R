#' Transact with the secondary market
#'
#' Buy or sell notes on the FOLIOfn secondary market
#'
#' @param loanId The loan ID
#' @param orderId The loan's order ID
#' @param noteId The loan's note ID
#' @param expireDate The date the sell offer will expire. Can be as short as the
#' current date or up to 7 days from posting the offer. Character string.
#' @param Price Price you wish to sell your loan for. Remember to consider
#' the accrued interest in your offering.
#' @param ... These arguments are available to avert prior version breakage
#' @inheritParams AccountSummary
#' @export
#'


FolioSell<- function(loanId, orderId, noteId, expireDate= NULL, Price=NULL, LC_CRED=NULL, ...){


    args<- list(...)

    if(exists(args$askingPrice)){
        Price<- args$askingRpice
        }


    LC_CRED<-CheckCred(LC_CRED)

    if(is.null(expireDate)){
        expireDate<- as.character(format(as.Date(Sys.time())+5,"%m/%d/%Y"))
        }

    postURL<- MakeURL(LC_CRED$investorID, "trades/sell")

    params<- list("aid"=LC_CRED$investorID,
                  "expireDate"= expireDate,
                  "notes"=data.frame(
                      "loanId"=loanId,
                      "orderId"= orderId,
                      "noteId"= noteId,
                      "askingPrice"= askingPrice,
                      stringsAsFactors = F))

    LC_POST(postURL,params, LC_CRED$key)

    }
