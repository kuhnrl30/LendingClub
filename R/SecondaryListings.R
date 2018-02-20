#' Loans listed on Folio marketplace
#'
#' Returns a dataframe of loans listed on the secondary market.
#' @param updatedSince filter listings to include only ones that were modified/created within the last X minutes.
#' @export
#'
SecondaryListing<- function(updatedSince=5){
    
    

    LC_CRED<-CheckCred(LC_CRED)
    
    searchURL<-'https://api.lendingclub.com/api/investor/v1/secondarymarket/listings'
    
    r<- httr::GET(searchURL, 
                       query=list('updatedSince' = 200),
                       httr::add_headers("Authorization"= LC_CRED[[2]],
                                         "Accept" = " text/csv"))

    parsed<- httr::content(r,
                           as="parsed",
                           encoding ='UTF-8',
                           col_types= "iinncnnniciiTTccinnic")

    structure(
        list(content = parsed,
             response = r),
        class = c("folio_api","LendingClub_api"))
    
    # # ----    
    # parsed<- jsonlite::fromJSON(httr::content(r, "text", encoding="UTF-8"),
    #                             simplifyVector = TRUE)
    # 
    # result<- httr::content(result,
    #                        as="text",
    #                        type="text/csv",
    #                        encoding ='UTF-8')
    # 
    # parsed<-unlist(strsplit(result, "\n"))
    # parsed<-lapply(parsed, function(x) unlist(strsplit(x, ",")))
    # parsed<-matrix(unlist(parsed), ncol=21, nrow=length(parsed), byrow = T)
    # parsed<- as.data.frame(gsub("\"" ,"", parsed))
    # colnames(parsed)<- unname(unlist(parsed[1, ]))
    # 
    # # result<- LC_GET(searchURL, LC_CRED$key, margin=T)
    # 
    # 
    # class(parsed)<- "SecondaryListing"
    # 
    # parsed
    
    }
