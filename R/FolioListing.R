#' Notes listed on Folio marketplace
#'
#' Returns a dataframe of notes listed on the secondary market.
#' @param updatedSince filter listings to include only notes that were modified/created within the last X minutes.
#' @inheritParams AccountSummary_
#' @export
#'
#' @details This function can return the complete listing of notes on the secondary market or just 
#' those that have been recently updated.  The complete listing of loans may take a significant 
#' amount of time to download depending on the users internet connection speed. 
#' 
#' Notes listed on the market automatically expire in 7 days.  The seller may reset the expiration 
#' date by changing the price on the note. 
#' 
#' @return A data.frame.  If the entire current listings are returned, the data frame will have 22 columns.  If a subset of the listings are returned, via the updatedSince argument, then the returned data frame will have 21 columns. 
FolioListing<- function(updatedSince=NULL, LC_CRED=NULL){
    
    # if not time provided then pull complete listings
    if (is.null(updatedSince)){
        
        message("This may take a while...")
        tmp<- tempfile()
        download.file(url= "https://resources.lendingclub.com/SecondaryMarketAllNotes.csv",
                      destfile= tmp)
        read.csv(tmp)
        
    } else {
    # if time supplied, return filtered list
        LC_CRED<-CheckCred(LC_CRED)
        
        searchURL<-'https://api.lendingclub.com/api/investor/v1/secondarymarket/listings'
        
        r<- httr::GET(searchURL, 
                      query=list('updatedSince' = updatedSince),
                      httr::add_headers("Authorization"= LC_CRED[[2]],
                                        "Accept" = " text/csv"))
        
        
        parsed<- suppressWarnings(httr::content(r,
                               as="parsed",
                               encoding ='UTF-8',
                               col_types= "iinncnnniciiTTccinnic"))
        
        structure(
            list(content = parsed,
                 response = r),
            class = c("folio_api","LendingClub_api"))
    }
    }
