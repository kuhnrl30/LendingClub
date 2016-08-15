#' Print the Output from an API call
#'
#' This is a general function to print the conent from an API
#' call. The API call returns a list of 2 elements: The first
#' is the content from the call and the second element is the
#' actual response.
#' @param object an object of class LendingClub_api
#' @export
#' @usage
#' print(object)
print.LendingClub_api <- function(object, ...) {
    cat("<LendingClub API>\n")
    print(object$content)
    invisible(object)
}
