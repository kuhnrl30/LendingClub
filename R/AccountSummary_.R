#' Return the investor's Account Summary
#'
#' Access the user's account and return the summary data.  The data points
#' include available cash, total account balance, and the number of notes in the
#' account  @aliases.
#'
#' @param LC_CRED Credential object having class LendingClub_credential. This object can be created using the \code{MakeCredential()} function. You can pass the object directly as an argument to the function or alternatively, it can be read from the global environment if it was stored as "LC_CRED".
#' 
#' @return Object of class LendingClub_api. The object has two components. The first is \code{$content} with a data.frame of attributes of the invenstor's account such as available cash and value of the portfolios. The data arranged as a 1 row data.frame with an attribute in each column.  The second component is the \code{$response} including a timestamp of when the data was retrieved.
#' 
#' @examples
#' \dontrun{
#' LC_CRED<- MakeCredential(InvestorID, APIKey)
#' AccountSummary()}
#' 
#' @export
AccountSummary_<- function(LC_CRED=NULL){

    LC_CRED<-CheckCred(LC_CRED)

    searchURL<-MakeURL(LC_CRED$investorID, "summary")

    result<- LC_GET(searchURL, LC_CRED$key, margin=T)
    
    class(result)<- "AccountSummary"
    
    result

    }
