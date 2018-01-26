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
#' @seealso \itemize{
#' \item{\url{http://ryankuhn.net/LendingClub}}
#' \item{\url{http://github.com/kuhnrl30/LendingClub/issues} for bug reports}
#' }
NULL


## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")  utils::globalVariables(c("LC_CRED"))