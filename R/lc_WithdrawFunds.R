#' Withdraw funds
#'
#' Withdraw funds from the investor's account
#' @param amount Amount to be transferred
#' @inheritParams lc_AccountSummary
#' @export
#'
lc_WithdrawFunds<- function(amount, LC_CRED=NULL){

    if (amount<=0) stop("Enter positive amount to withdraw")
    
    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID, "funds/withdraw")

    params<- list("investorId"=LC_CRED$investorID,
                  "amount"=amount)


    LC_POST(postURL,params, LC_CRED$key)

}
