library(shiny)

# shinyUI(
#     navbarPage("Lending Club Access",
#         navbarMenu("Account Actions",
#                    tabsetPanel("AcctActs",
#                        tabPanel("Account Summary",
#                                 verbatimTextOutput("oAccountSummary")),
#                        tabPanel("Portfolios Owned",
#                                 DT::dataTableOutput("oPortfoliosOwned")),
#                        tabPanel("Notes Owned",
#                                 DT::dataTableOutput("oNotesOwned")),
#                        tabPanel("Detailed Notes Owned",
#                                 DT::dataTableOutput("oDetailedNotesOwned"))
#                        )),
#         navbarMenu("Notes",
#                    tabsetPanel("NotesMenu",
#                        tabPanel("Primary Market",
#                             actionButton("bBuy",
#                                          "Buy"),
#                             actionButton("bSell",
#                                          "Sell"),
#                             tags$br(),
#                             tags$br(),
#                             DT::dataTableOutput("oListedLoans")),
#                    tabPanel("Secondary Market",
#                             DT::dataTableOutput("oSecondary"))
#                     )),
#         navbarMenu("Transfers",
#                    tabPanel("Add Funds"),
#                    tabPanel("Withdraw")
#                    )
#     ))

shinyUI(
    navbarPage("Lending Club Access",
               tabPanel("Account Actions",
                        tabsetPanel("AcctActs",
                                      tabPanel("Account Summary",
                                               tags$br(),
                                               DT::dataTableOutput("oAccountSummary")),
                                      tabPanel("Portfolios Owned",
                                               tags$br(),
                                               DT::dataTableOutput("oPortfoliosOwned")),
                                      tabPanel("Notes Owned",
                                               tags$br(),
                                               textInput('LoanId', 'Loan ID'),
                                               actionButton("bSell",

                                                            "Sell"),
                                               tags$br(),
                                               tags$br(),
                                               DT::dataTableOutput("oNotesOwned")),
                                      tabPanel("Detailed Notes Owned",
                                               actionButton("bSell",

                                                            "Sell"),
                                               DT::dataTableOutput("oDetailedNotesOwned"))
                          )),
               tabPanel("Notes",
                          tabsetPanel("NotesMenu",
                                      tabPanel("Primary Market",
                                               actionButton("bBuy",
                                                            "Buy Note"),
                                               tags$br(),
                                               tags$br(),
                                               DT::dataTableOutput("oListedLoans")),
                                      tabPanel("Secondary Market",
                                               DT::dataTableOutput("oSecondary"))
                          )),
               tabPanel("Transfers",
                          tabsetPanel("TransferMenu",
                                      tabPanel("Add Funds"),
                                      tabPanel("Withdraw"),
                                      tabPanel("Cancel Transfer",
                                               DT::dataTableOutput("oTransfers"))
                                      )),
               tabPanel("Setup")

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
