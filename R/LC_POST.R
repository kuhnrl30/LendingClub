#' Wrapper for POST
#'
#' A wrapper for POST which passes the data to the L/C server. Data
#' is encoded as json.
#' @param postURL URL passed to the Lending Club API
#' @param params parameters passed to the API
#' @param auth API key
#'
LC_POST<- function(postURL, params, auth ){
    httr::POST(postURL,
               body=params,
               encode="json",
               httr::add_headers("Authorization"= auth))

    }
