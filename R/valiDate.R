valiDate<- function(x,form){
    tryCatch(as.Date(x, format=form), error= function(x) NA)
    }
