#' Cancel a scheduled transfer
#'
#' Cancel a scheduled transfer. You can get a listing of
#' scheduled transfers by using the \code{PendingTransfers()}
#' funciton.
#'
#'
#' @param transferId Numeric. Unique ID for the scheduled transfer
#' @inheritParams AccountSummary
#' @export
CancelTransfer<- function(transferId, LC_CRED=NULL){
    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID,"funds/cancel")

    params<- list("transferIds" = list(transferId))

    LC_POST(postURL, params, LC_CRED$key)

}
