#' Make the search URL
#'
#' Assembles the search URL from the invstor ID and the type of query
#' @param investorID Investor ID which is the same as the account number
#' @param append string to append at the end of the URL

MakeURL<- function(investorID, append){
    base<-"https://api.lendingclub.com/api/investor/v1/accounts/"
    paste0(base,investorID,"/",append)
    }
