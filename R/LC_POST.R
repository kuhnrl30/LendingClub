#' Wrapper for POST
#'
#' A wrapper for POST which passes the data to the L/C server. Data
#' is encoded as json.
#' @param postURL URL passed to the Lending Club API
#' @param params parameters passed to the API
#' @param auth API key
#' @keywords internal
#'
LC_POST<- function(postURL, params, auth, quiet = T ){
    r<- httr::POST(postURL,
               body=params,
               encode="json",
               httr::add_headers("Authorization"= auth,
                                 "Content-Type"="application/json"))

    ResponseHandler(r, quiet)

    }
