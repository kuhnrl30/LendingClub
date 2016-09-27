#' Print the Output from an API call
#'
#' This is a general function to print the conent from an API
#' call. The API call returns a list of 2 elements: The first
#' is the content from the call and the second element is the
#' actual response.
#' @param x an object of class LendingClub_api
#' @param ... To pass additional arguments to the generic print function
#' @keywords internal

print.LendingClub_api <- function(x, ...) {
    cat("<LendingClub API>\n")
    print(x$content,...)
    invisible(x)
}
