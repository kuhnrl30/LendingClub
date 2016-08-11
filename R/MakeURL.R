#' Make the search URL
#'
#' Assembles the search URL from the invstor ID and the type of query

MakeURL<- function(investorID, append){
    base<-"https://api.lendingclub.com/api/investor/v1/accounts/"
    paste0(base,investorID,"/",append)
    }
