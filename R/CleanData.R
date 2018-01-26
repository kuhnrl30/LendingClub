#' Convert the list to dataframe
#'
#' Converts the list of notes from function NotesOwned to a dataframe
#'
#' @param x list to be cleaned
#' @param margin logical- True for summary data, False for dataframe
#' @keywords internal

CleanData<- function(x, margin=T){

        if(margin){
        
        y<- unlist(x)
        
        z<- as.data.frame(t(y), col.names=names(y))
        
        # z<-data.frame("Field"= names(y),
        #               "Value"= as.character(y),
        #               stringsAsFactors = F,
        #               row.names = NULL)
        z
        }
    else {
        y<- data.frame(do.call("cbind", x[[1]]), stringsAsFactors = F)
        rownames(y)<- NULL
        data.frame(y)
    }
}
