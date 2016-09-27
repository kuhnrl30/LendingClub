#' Buy notes from the secondary market
#'
#' Buy notes from the folio secondary market.
#' @param loanId Loan ID number
#' @param orderId Order ID number
#' @param noteId Note Id number
#' @param bidPrice Notes list price.
#' @inheritParams AccountSummary
#'
#' @export


FolioBuy<- function(loanId, orderId, noteId, bidPrice, LC_CRED=NULL){

     LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID, "trades/buy")

    params<- list("aid"=LC_CRED$investorID,
                  "notes"= data.frame(
                      "loanId"= loanId,
                      "orderId"= orderId,
                      "noteId"= noteId,
                      "bidPrice"= bidPrice,
                      stringsAsFactors = F))


    LC_POST(postURL,params, LC_CRED$key)
}
