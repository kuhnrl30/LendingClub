#' Convert the list to dataframe
#'
#' Converts the list of notes from function NotesOwned to a dataframe
#'
#' @param x list to be cleaned
CleanData<- function(x, ncols){
    df<- data.frame(matrix(unlist(x), ncol=ncols, byrow=T), stringsAsFactors = F)
    names(df)<-names(x[[1]][[1]])
    df
}
