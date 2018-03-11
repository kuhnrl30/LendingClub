#' Deprecated functions in the \pkg{LendingClub} package.
#' 
#' The functions listed below are provided for compatability with older 
#' versions of the LendingClub package. They are deprecated and may 
#' be removed (defunct) in later versions. 
#' - \code{ \link{AccountSummary}} is now \code{ \link{lc_AccountSummary}}
#' - \code{ AccountSummary_} is now \code{ \link{lc_AccountSummary}}
#' - \code{ AddFunds} is now \code{\link{lc_AddFunds}}
#' - \code{ AvailableCash} is not \code{\link{lc_AvailableCash}}
#' 
#' @name LendingClub-deprecated
#' @rdname LendingClub-deprecated
#' @param ... Parameters to be passed to the modern versions of the function
#' @docType package
#' @export AccountSummary_ AddFunds AvailableCash CancelTransfer
#' @aliases AccountSummary_ AddFunds AvailableCash CancelTransfer
AccountSummary_<- function(...){
    .Deprecated("lc_AccountSummary", package="LendingClub")
    lc_AccountSummary(...)
    }

AddFunds<- function(...){
    .Deprecated("lc_AddFunds", package="LendingClub")
    lc_AddFunds(...)
    }

AvailableCash<- function(...){
    .Deprecated("lc_AvailableCash", package="LendingClub")
    lc_AvailableCash(...)
    }

CancelTransfer<- function(...){
    
    .Deprecated("lc_CancelTransfer", package="LendingClub")
    lc_CancelTransfer(...)
    }