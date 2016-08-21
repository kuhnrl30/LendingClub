#' Buy a note from the secondary market
#'
#' @param loanId Numeric identifier of the loan whose note requested for purchase
#' @param orderId Numeric identifier of the order for the note
#' @param noteId  Numeric identifier of the note
#' @param bidPrice 	Positive numeric value in dollars ($) and cents representing the buy price desired for the note
#' @export
BuySecondary<- function(loanId, orderId, noteId, bidPrice){

    LC_CRED<-CheckCred()

    postURL<-MakeURL(LC_CRED$investorID, "trades/buy")

    params<- list("Aid"= LC_CRED$investorID,
                  "notes"= list(
                      "loanId"= loanId,
                      "orderId"= orderId,
                      "noteId"= noteId,
                      "bidPrice"= bidPrice))

    LC_POST(postURL, params, LC_CRED$key)

}
