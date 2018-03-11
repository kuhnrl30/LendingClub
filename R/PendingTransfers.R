#' Return investor's pending transfers
#'
#' Uses Lending Club's API to access the user's account and return the summary
#' @inheritParams lc_AccountSummary
#' @export
PendingTransfers<- function(LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<-MakeURL(LC_CRED$investorID, "funds/pending")

    # LC_GET(searchURL, LC_CRED$key, margin=T)

    # Remove call to LC_GET and replace with the code to maintain old CleanData
    # LC_GET(searchURL, LC_CRED$key, margin=T)
    r<- httr::GET(searchURL,
                  httr::user_agent("http://www.github.com/kuhnrl30/LendingClub"),
                  httr::add_headers("Authorization"= LC_CRED$key))
    
    
    if(httr::status_code(r)!=200){
        stop("LendingClub API request failed")
    }
    
    parsed<- jsonlite::fromJSON(httr::content(r, "text", encoding="UTF-8"),
                                simplifyVector = TRUE)
    
    if (httr::http_error(r)) {
        stop(
            sprintf(
                "LendingClub API request failed [%s]\n%s\n<%s>",
                status_code(r),
                parsed$message,
                parsed$documentation_url
            ),
            call. = FALSE
        )
    }
    
    # Removed CleanData call and replaced with the underlying code
    # parsed<- CleanData(parsed, margin)
    parsed<- {
        y<- unlist(parsed)
        
        data.frame("Field"= names(y),
                   "Value"= as.character(y),
                   stringsAsFactors = F,
                   row.names = NULL)
    }
    
    
    structure(
        list(content = parsed,
             response = r),
        class = "LendingClub_api")
}

