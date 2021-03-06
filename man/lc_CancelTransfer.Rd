% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lc_CancelTransfer.R
\name{lc_CancelTransfer}
\alias{lc_CancelTransfer}
\title{Cancel a scheduled transfer}
\usage{
lc_CancelTransfer(transferId, LC_CRED = NULL)
}
\arguments{
\item{transferId}{Numeric. Unique ID for the scheduled transfer}

\item{LC_CRED}{Credential object having class LendingClub_credential. This object can be created using the \code{lc_MakeCredential()} function. You can pass the object directly as an argument to the function or alternatively, it can be read from the global environment if it was stored as "LC_CRED".}
}
\description{
Cancel a scheduled transfer. You can get a listing of
scheduled transfers by using the \code{PendingTransfers()}
funciton.
}
