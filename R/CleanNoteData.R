#' Convert the list to dataframe
#'
#' Converts the list of notes from function NotesOwned to a dataframe
#'
#' @param x list to be cleaned
CleanNoteData<- function(x){
    df<- data.frame(matrix(unlist(x), ncol=14, byrow=T), stringsAsFactors = F)
    names(df)<-names(x$myNotes[[1]])
    df
}
