#' Buy a note from the secondary market
#'
#' Buy a not from the secondary Folio market. You can get the listing
#' buy using the \code{FolioListing()} function.
#'
#' @param loanId Numeric identifier of the loan whose note requested f
#' or purchase
#' @param orderId Numeric identifier of the order for the note
#' @param noteId  Numeric identifier of the note
#' @param bidPrice 	Positive numeric value in dollars ($) and cents r
#' epresenting the buy price desired for the note
#' @inheritParams AccountSummary
#' @export
BuySecondary<- function(loanId, orderId, noteId, bidPrice, LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    postURL<-MakeURL(LC_CRED$investorID, "trades/buy")

    params<- list("Aid"= LC_CRED$investorID,
                  "notes"= list(
                      "loanId"= loanId,
                      "orderId"= orderId,
                      "noteId"= noteId,
                      "bidPrice"= bidPrice))

    LC_POST(postURL, params, LC_CRED$key)

}
