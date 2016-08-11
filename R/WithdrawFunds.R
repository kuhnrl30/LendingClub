#' Withdraw funds
#'
#' Withdraw funds from the investor's account
#' @param amount amount to be transferred
#' @export
#'
WithdrawFunds<- function(amount){

    LC_CRED<-CheckCred()

    postURL<- MakeURL(LC_CRED$investorID, "funds/withdraw")

    params<- list("investorId"=LC_CRED$investorID,
                  "amount"=amount)


    LC_POST(postURL,params, LC_CRED$key)
}
