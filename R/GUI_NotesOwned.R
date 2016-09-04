#' @export
GUI_NotesOwned<- function(){
    NotesOwned()$content %>%
        select(loanId:paymentsReceived) %>%
        GUI_Headers()
}
