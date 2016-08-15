#' Convert the list to dataframe
#'
#' Converts the list of notes from function NotesOwned to a dataframe
#'
#' @param x list to be cleaned
CleanData<- function(x, margin=T){
    if(margin){
        x<-data.frame(do.call(rbind, x), stringsAsFactors = F)
        x$Field <- row.names(x)
        names(x)<- c("Value","Field")
        rownames(x)<- NULL
        x[,c(2,1)]}
    else {
        x<- t(data.frame(do.call(cbind, x[[1]]), stringsAsFactors = F))
        rownames(x)<- NULL
        data.frame(x)
    }
}
