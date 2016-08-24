library(shiny)

shinyUI(navbarPage("Lending Club Access",
                navbarMenu("Account Actions",
                           tabPanel("Account Summary",
                                    verbatimTextOutput("oAccountSummary")),
                           tabPanel("Portfolios Owned",
                                    DT::dataTableOutput("oPortfoliosOwned")),
                           tabPanel("Notes Owned",
                                    DT::dataTableOutput("oNotesOwned")),
                           tabPanel("Detailed Notes Owned",
                                    DT::dataTableOutput("oDetailedNotesOwned"))
                           ),
                navbarMenu("Notes",
                           tabPanel("Primary Market",
                                    DT::dataTableOutput("oListedLoans")),
                           tabPanel("Secondary Market",
                                    DT::dataTableOutput("oSecondary"))
                            ),
                navbarMenu("Transfers",
                           tabPanel("Add Funds"),
                           tabPanel("Withdraw")
                           )
))






    # sidebarLayout(
    #     sidebarPanel(selectInput("accountactions",
    #                              "Account Actions:",
    #                              choices=c("Account Summary",
    #                                        "Portfolios Owned",
    #                                        "Notes Owned",
    #                                        "Detailed Notes Owned")),
    #                  submitButton("Go")),
    #
    #     mainPanel(h5(uiOutput("header_panel")),
    #               verbatimTextOutput("acct"))
    #
    # )
