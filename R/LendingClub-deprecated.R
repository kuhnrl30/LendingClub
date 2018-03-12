#' Deprecated functions in the \pkg{LendingClub} package.
#' 
#' The functions listed below are provided for compatability with older 
#' versions of the LendingClub package. They are deprecated and may 
#' be removed (defunct) in later versions. 
#' - \code{ \link{AccountSummary}} is now \code{ \link{lc_AccountSummary}}
#' - \code{ AccountSummary_} is now \code{ \link{lc_AccountSummary}}
#' - \code{ AddFunds} is now \code{\link{lc_AddFunds}}
#' - \code{ AvailableCash} is now \code{\link{lc_AvailableCash}}
#' - \code{ CreatePortolio} is now \code{\link{lc_CreatePortfolio}}
#' - \code{ MakeCredential} is now \code{\link{lc_MakeCredential}}
#' - \code{ Dashboard} is now \code{\link{lc_Dashboard}}
#' - \code{ DetailedNotesOwned} is now \code{\link{lc_DetailedNotesOwned}}
#' - \code{ NotesOwned } is now \code{\link{lc_NotesOwned}}
#' 
#' @name LendingClub-deprecated
#' @rdname LendingClub-deprecated
#' @param ... Parameters to be passed to the modern versions of the function
#' @docType package
#' @export AccountSummary_ AddFunds AvailableCash CancelTransfer CreatePortfolio MakeCredential
#' @export Dashboard DetailedNotesOwned NotesOwned PendingTransfers
#' @aliases AccountSummary_ AddFunds AvailableCash CancelTransfer CreatePortfolio MakeCredential
#' @aliases Dashboard DetailedNotesOwned NotesOwned PendingTransfers

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

CreatePortfolio<- function(...){
    .Deprecated("lc_CreatePortfolio", package="LendingClub")
    lc_CreatePortfolio(...)
    }

MakeCredential<- function(...){
    .Deprecated("lc_MakeCredential", package="LendingClub")
    lc_MakeCredential(...)
    }

Dashboard<- function(...){
    .Deprecated("lc_Dashboard", package="LendingClub")
    lc_Dashboard(...)
    }

DetailedNotesOwned<- function(...){
    .Deprecated("lc_DetailedNotesOwned", package="LendingClub")
    lc_DetailedNotesOwned(...)
    }

NotesOwned<- function(...){
    .Deprecated("lc_NotesOwned", package="LendingClub")
    lc_NotesOwned(...)
    }

PendingTransfers<- function(...){
    .Deprecated("lc_PendingTransfers", package="LendingClub")
    lc_PendingTransfers(...)
    }

