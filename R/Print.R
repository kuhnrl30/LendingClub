#' Print the output from an API call
#'
#' This is a general function to print the conent from an API
#' call. The API call returns a list of 2 elements: The first
#' is the content from the call and the second element is the
#' actual response.
#' @param x an object of class LendingClub_api
#' @param ... To pass additional arguments to the generic print function
#' @export



print.LendingClub_api <- function(x, ...) {
    cat("<LendingClub API>\n")
    print(x$content,...)
    invisible(x)
}

#' Print the output from an API call
#'
#' This is a general function to print the content from an API
#' call. The API call returns a list of 2 elements: The first
#' is the content from the call and the second element is the
#' actual response.
#' @param x an object of class LendingClub_api
#' @param ... To pass additional arguments to the generic print function
#' @export

print.AccountSummary <- function(x, ...) {
    cat("<LendingClub Account Summary>\n")
    for (i in 1:ncol(x$content)){
        d<- x$content[1, i]
        e<- colnames(x$content)[i]
        cat(paste0(e, ":", strrep(" ", 50-nchar(e)- nchar(d)), d, "\n"))
    }
    invisible(x)
}


#' Print the LC_CRED object
#'
#' This function prints the content from the MakeCredential 
#' call.
#' @param x an object of class LendingClub_api
#' @param ... To pass additional arguments to the generic print function
#' @export

print.LendingClub_credential <- function(x, ...) {
    cat("<LendingClub Credential>\n")
    cat(paste0("investorID: ", x$investorID, "\n",
               "key: ", strrep(" ", 7), x$key))
    invisible(x)
}