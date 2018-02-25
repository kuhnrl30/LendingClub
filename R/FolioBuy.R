#' @rdname FolioSell
#' @export

FolioBuy<- function(loanId=NULL, orderId=NULL, noteId, Price= NULL, LC_CRED=NULL, quiet=T){
    
    #check for deprecated variables
    calls <- names(sapply(match.call(), deparse))[-1]
    if(any("loanId" %in% calls)) warning("The loanId variable is deprecated")
    if(any("orderId" %in% calls)) warning("The orderId variable is deprecated")
    
    LC_CRED<-CheckCred(LC_CRED)

    postURL<- paste0("https://api.lendingclub.com/api/investor/v1/secondarymarket/accounts/",
                     LC_CRED[[1]],
                     "/orders")

    params<-  data.frame(
                      "noteId"= noteId,
                      "price"= Price,
                      "orderType"= "BUY",
                      stringsAsFactors = F)


    resp<- LC_POST(postURL,params, LC_CRED$key)
    
    if (!quiet) {
        data.frame(do.call("cbind", resp[[1]]), stringsAsFactors = F)
    }
}
