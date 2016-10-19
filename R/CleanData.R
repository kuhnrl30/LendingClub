#' Convert the list to dataframe
#'
#' Converts the list of notes from function NotesOwned to a dataframe
#'
#' @param x list to be cleaned
#' @param margin logical- True for summary data, False for dataframe
#' @keywords internal
CleanData<- function(x, margin=T){
    if(margin){
        # y<-data.frame(do.call(rbind, x), stringsAsFactors = F)
        # y$Field <- row.names(y)
        # names(y)<- c("Value","Field")
        # rownames(y)<- NULL
        # y[,c(2,1)]}
        y<- data.frame(x)
        z<-data.frame("Field"= names(y),
                      "Value"=as.character(y[1,]),
                      stringsAsFactors = F)
        z
        }
    else {
        y<- data.frame(do.call("cbind", x[[1]]), stringsAsFactors = F)
        rownames(y)<- NULL
        data.frame(y)
    }
}
