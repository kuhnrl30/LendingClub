#' Convert the list to dataframe
#'
#' Converts the list of notes from function NotesOwned to a dataframe
#'
#' @param x list to be cleaned
CleanData<- function(x){
    data.frame(do.call(rbind, x), stringsAsFactors = F)
}
