#' Setup a funds transfer
#'
#' Sets up a recurring or one-time funds transfer. The investor must
#' already have setup the account from which the funds are transferred.
#' Transfers can one-time or recurring.
#' @param amount amount to be transferred
#' @param freq frequency of transfers. Optional.  If a value is not
#' supplied, then the transfer will be processed immediately.
#' @param start date formatted as YYYY/MM/DD. If a date is not
#' @param end date formatted as YYYY/MM/DD
#' @export
#'
TransferFunds<- function(amount, freq= NULL, start=NULL, end=NULL){
    # Error checking and data validation
    if(!is.numeric(amount)){
        stop("amount must be numeric")
        }

    freqVals<- c("LOAD_NOW",
                 "LOAD_ONCE",
                 "LOAD_WEEKLY",
                 "LOAD_BIWEEKLY",
                 "LOAD_ON_DAY_1_AND_16",
                 "LOAD_MONTHLY")

    if(!freq %in% freqVals){
        stop("freq value does not match acceptable values")
    }

    if(!is.null(start)){
        if(is.na(valiDate(start,"%Y-%m-%d"))){
            stop("start is not a valid date format: YYYY-MM-DD")
            }
        }

    if(freq=="LOAD_NOW"){
        start=NULL
        end=NULL
        }

    if(!freq=="LOAD_NOW" & is.null(start)){
        stop("start required for future transfers")
    }



    LC_CRED<-CheckCred()

    postURL<- MakeURL(LC_CRED$investorID, "funds/add")

    params<- list("investorId"=LC_CRED$investorID,
                  "amount"=amount,
                  "transferFrequency"=freq,
                  "startDate"= start,
                  "endDate"= end)


    LC_POST(postURL,params, LC_CRED$key)
}
