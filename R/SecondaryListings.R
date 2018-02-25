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
    
    }
