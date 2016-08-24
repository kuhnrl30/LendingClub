#' @export
#'
FolioBuy<- function(loanId, orderId, noteId, bidPrice){

     LC_CRED<-CheckCred()

    postURL<- MakeURL(LC_CRED$investorID, "trades/buy")

    params<- list("aid"=LC_CRED$investorID,
                  "notes"=list(
                      "loanId"=loanId,
                      "orderId"= orderId,
                      "noteId"= noteId,
                      "bidPrice"= bidPrice))


    r<-LC_POST(postURL,params, LC_CRED$key)
    httr::stop_for_status(r)
    r
}
