#' Add funds to the investor's account
#'
#' Sets up a recurring or one-time funds transfer. The investor must have
#' already setup the bank account from which the funds are transferred.
#' Transfers can one-time or recurring.
#'
#' @param amount Numeric. Amount to be transferred
#' @param freq String. Frequency of transfers. Optional.  The default value
#' is LOAD_NOW so if a value is not supplied the transfer will be
#' processed immediately. If a value is supplied, it must me one of:
#' \itemize{
#' \item LOAD_NOW (default)
#' \item LOAD_ONCE
#' \item LOAD_WEEKLY
#' \item LOAD_BIWEEKLY
#' \item LOAD_ON_DAY_1_AND_15
#' \item LOAD_MONTHLY
#' }
#'
#' @param start  String. Defaults to NULL and is not required for immediate
#' transfers. For future transfers, the date must be a string formatted
#' as YYYY/MM/DD.
#' @param end String. Defaults to NULL and is not required for immediate
#' transfers. For future transfers, the date must be a string formatted
#' as YYYY/MM/DD.
#' @param quiet Should the response be printed to the console
#' @inheritParams AccountSummary

#' @export
#'
AddFunds<- function(amount, freq= "LOAD_NOW", start=NULL, end=NULL, quiet=T, LC_CRED=NULL){
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



    LC_CRED<-CheckCred(LC_CRED)

    postURL<- MakeURL(LC_CRED$investorID, "funds/add")

    params<- list("transferFrequency"=freq,
                  "amount"=amount,
                  "startDate"= start,
                  "endDate"= end)


    resp<- LC_POST(postURL,params, LC_CRED$key)
    
    if (!quiet) {
        data.frame(rbind(unlist(resp)))
        }
}
