#' Return the investor's Account Summary
#'
#' Access the user's account and return the summary data.  The data points
#' include available cash, total account balance, and the number of notes in the
#' portfolio.
#'
#' @param LC_CRED Credential object having class LendingClub_credential. This object can be created using the \code{MakeCredential()} function. You can pass the object directly as an argument to the function or alternatively, it can be read from the global environment if it was stored as "LC_CRED".
#' 
#' @return Object of class LendingClub_api. The object has two components. The first is \code{$content} with a data.frame of attributes of the invenstor's account such as available cash and value of the portfolios. The attributes are arranged by rows in the first column and the values are in the second column.  The second component is the \code{$response} including a timestamp of when the data was retrieved.
#' @seealso \code{\link{LendingClub-deprecated}}
#' @examples
#' \dontrun{
#' LC_CRED<- lc_MakeCredential(InvestorID, APIKey)
#' AccountSummary()}
#' 
#' @export
AccountSummary<- function(LC_CRED=NULL){
    
    .Deprecated("AccountSummary_")
    
    LC_CRED<-CheckCred(LC_CRED)

    searchURL<-MakeURL(LC_CRED$investorID, "summary")

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
