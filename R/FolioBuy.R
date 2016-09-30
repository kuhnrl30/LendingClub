#' @rdname FolioSell
#' @name SecondaryMarket
#' @export

FolioBuy<- function(loanId, orderId, noteId, Price= NULL, LC_CRED=NULL, ...){

    LC_CRED<-CheckCred(LC_CRED)

    args<- list(...)

    if(exists(args$askingPrice)){
        Price<- args$askingRpice
    }

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
