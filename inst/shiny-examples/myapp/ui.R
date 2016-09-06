library(shiny)

shinyUI(
    navbarPage("Lending Club Access",
               tabPanel("Account Actions",

# Account tab ----
                        tabsetPanel("AcctActs",
                                      tabPanel("Account Summary",
                                               tags$br(),
                                               DT::dataTableOutput("oAccountSummary")),
                                      tabPanel("Portfolios Owned",
                                               tags$br(),
                                               DT::dataTableOutput("oPortfoliosOwned")),
                                      tabPanel("Notes Owned",
                                               id="tabNotesOwned",
                                               tags$br(),
                                               textInput('txtLoanId', 'Loan ID'),
                                               actionButton("bSell",

                                                            "Sell"),
                                               tags$br(),
                                               tags$br(),
                                               DT::dataTableOutput("oNotesOwned")),
                                      tabPanel("Detailed Notes Owned",
                                               tags$br(),
                                               actionButton("btnSell",

                                                            "Sell"),
                                               tags$br(),
                                               tags$br(),
                                               DT::dataTableOutput("oDetailedNotesOwned"))
                          )),

# Market tab ----

               tabPanel("Market",
                          tabsetPanel("NotesMenu",
                                      tabPanel("Primary Market",
                                               tags$br(),
                                               actionButton("btnBuy",
                                                            "Buy Note"),
                                               tags$br(),
                                               tags$br(),
                                               DT::dataTableOutput("oListedLoans")),
                                      tabPanel("Secondary Market",
                                               DT::dataTableOutput("oSecondary"))
                          )),

# Transfer tab ----

               tabPanel("Transfers",
                        tabsetPanel("TransferMenu",
                                    tabPanel("Scheduled Transfers",
                                             id="tabScheduledTransfers",
                                             tags$br(),
                                             actionButton("btnCancel",
                                                          "Cancel Transfer"),
                                             tags$br(),
                                             tags$br(),
                                             DT::dataTableOutput("oTransfers")),
                                    tabPanel("Add Funds",
                                             id="tabAddFunds",
                                             textInput("txtAmount", "Amount"),
                                             selectInput("txtFreq", "Frequency",
                                                         c("Now"="LOAD_NOW",
                                                           "One Time"="LOAD_ONCE",
                                                           "Weekly"="LOAD_WEEKLY",
                                                           "Biweekly"="LOAD_BIWEEKLY",
                                                           "1st and 15th"="LOAD_ON_DAY_1_AND_15",
                                                           "Monthly"="LOAD_MONTHLY")),
                                             textInput("txtStart", "Start Date"),
                                             textInput("txtEnd", "End Date")),
                                    tabPanel("Withdraw Funds",
                                             id="tabWithdrawFunds",
                                             tags$br(),
                                             textInput("txtAmount", "Amount"),
                                             actionButton("btnWithdraw",
                                                          "Withdraw")))),

# Setup tab ----

                        tabPanel("Setup",
                                 id="tabSetup",
                                 textInput("txtAccountNo", "Account Number"),
                                 textInput("txtKey", "API"))

    ))
