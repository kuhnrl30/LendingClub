#' Lending Club
#'
#' Providing the tools to work with the Lending Club API.
#' Both the primary and secondary markets can be accessed
#' with this package.
#' 
#' Lending Club is a peer-to-peer lending service where loans 
#' are broken up into $25 notes that investors buy with 
#' expectation of earing a return on the interest. This 
#' package is built to assist the investor manage
#' their account and maximize their return.
#' 
#' Users should note that the package will create a credential
#' object in the global environment which many of the 
#' functions require to access the API.
#' 
#' To learn more about the LendingClub package, start with
#' the vignette:
#' \code{vignette("LendingClub")}
#'
#' @docType package
#' @name LendingClub
#' @author Ryan Kuhn, CPA
#' @importFrom jsonlite "fromJSON"
#' @importFrom utils "download.file"
#' @importFrom utils "read.csv"
#' @import dplyr
#' @import httr
#'
NULL
