#' Wrapper for GET
#'
#' A wrapper for the GET function to pull the needed data
#' @param searchURL URL passed to the Lending Club API
#' @param auth API key
#' @return object with raw content from the API call and the GET response

LC_GET<- function(searchURL, auth, query=NULL, margin=T){
    r<- httr::GET(searchURL,
                  query=query,
                  httr::user_agent("http://www.github.com/kuhnrl30/LendingClub"),
                  httr::add_headers("Authorization"= auth))


    if(httr::status_code(r)!=200){
        stop("LendingClub API request failed")
        }

    parsed<- jsonlite::fromJSON(httr::content(r, "text", encoding="UTF-8"),
                                simplifyVector = FALSE)

    if (httr::http_error(r)) {
        stop(
            sprintf(
                "LendingClub API request failed [%s]\n%s\n<%s>",
                status_code(resp),
                parsed$message,
                parsed$documentation_url
            ),
            call. = FALSE
        )
    }

    if(!is.null(margin)){
        parsed<- CleanData(parsed, margin)
        }


    structure(
        list(content = parsed,
             response = r),
        class = "LendingClub_api")


}

