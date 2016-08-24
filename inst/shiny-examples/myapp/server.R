library(shiny)
library(LendingClub)
library(markdown)

shinyServer(function(input,output, session){

    output$oAccountSummary <- renderPrint({AccountSummary()$content})

    output$oPortfoliosOwned<- DT::renderDataTable({PortfoliosOwned()$content},
                                                  options = list(lengthMenu = c(5, 25, 50),
                                                                 pageLength = 5),
                                                  selection='single')

    output$oNotesOwned     <- DT::renderDataTable({NotesOwned()$content},
                                                  options = list(lengthMenu = c(5, 25, 50),
                                                                 pageLength = 10),
                                                  selection='single')

    output$oDetailedNotesOwned     <- DT::renderDataTable({DetailedNotesOwned()$content},
                                                      options = list(lengthMenu = c(5, 25, 50),
                                                                     pageLength = 5),
                                                      selection='single')

    output$oListedLoans    <- DT::renderDataTable({ListedLoans()$content},
                                                  options = list(lengthMenu = c(5, 25, 50),
                                                                 pageLength = 10),
                                                  selection='single')

    output$oSecondary      <- DT::renderDataTable({FolioListing()},
                                                  options = list(lengthMenu = c(5, 25, 50),
                                                                 pageLength = 10),
                                                  selection='single')
    })


