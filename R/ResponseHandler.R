ResponseHandler<- function(r){


    if (http_error(r)) {

        stop(
            sprintf(
                "LendingClub API request failed [%s]",
                status_code(r)
                # ,msg$errors$message
            ),
            call. = FALSE
        )
        }
    }
