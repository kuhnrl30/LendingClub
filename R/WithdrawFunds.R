#' Withdraw funds
#'
#' Withdraw funds from the investor's account
#' @param amount Amount to be transferred
#' @inheritParams AccountSummary
#' @export
#'
WithdrawFunds<- function(amount, LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID, "funds/withdraw")

    params<- list("investorId"=LC_CRED$investorID,
                  "amount"=amount)


    LC_POST(postURL,params, LC_CRED$key)
}
