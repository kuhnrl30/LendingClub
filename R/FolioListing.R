#' Loans listed on Folio marketplace
#'
#' Returns a dataframe of loans listed on the secondary market.
#' @export
#'
FolioListing<- function(){
    message("This may take a while...")
    tmp<- tempfile()
    download.file(url= "https://resources.lendingclub.com/SecondaryMarketAllNotes.csv",
                  destfile= tmp)
    read.csv(tmp)
    }
