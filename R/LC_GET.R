#' Wrapper for GET
#'
#' A wrapper for the GET function to pull the needed data
#' @param searchURL URL passed to the Lending Club API
#' @param auth API key

LC_GET<- function(searchURL, auth){
    r<- httr::GET(searchURL,
                  httr::user_agent("http://www.github.com/kuhnrl30/LendingClub"),
                  httr::add_headers("Authorization"= auth))


    if(httr::status_code(r)!=200){
        stop("API Call was not successful")
        }


    httr::content(r)
    }
