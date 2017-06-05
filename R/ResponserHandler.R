ResponseHandler<- function(r){


    if (http_error(r)) {
        
        x<- status_code(r)
        
        message(
            case_when(
                x %% 403 == 0 ~ "Authentication failure",
                x %% 500 == 0 ~ "Unsuccessful execution",
                TRUE ~ sprintf("LendingClub API request failed")))
        }
    }
    