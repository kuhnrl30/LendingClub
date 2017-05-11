ResponseHandler<- function(r, quiet){


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
    if (!quiet) {
        d<- content(r,"parsed")$orderConfirmations
        cbind(as.data.frame(t(sapply(d, function(x) x[1:3]))),
              executionStatus= sapply(d, function(x) paste0(x$executionStatus, collapse=", "))) 
        }
    }
