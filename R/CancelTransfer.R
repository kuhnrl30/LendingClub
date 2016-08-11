#' Cancel a transfer
#'
#' Uses Lending Club's API to cancel a scheduled transfer.
#' @param transferId unique ID for the scheduled transfer
#' @export
CancelTransfer<- function(transferId){
    LC_CRED<-CheckCred()

    postURL<- MakeURL(LC_CRED$investorID,"funds/cancel")

    params<- list("investorID" = LC_CRED$investorID,
                  "transferId" = transferId)

    LC_POST(postURL, params, LC_CRED$key)
}
