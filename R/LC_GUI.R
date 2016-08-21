#' Open the Lending Club GUI
#'
#' Open the Lending Club GUI to interact with the data interactively
#' @export
OpenGUI <- function(){
# setwd("c:/users/ryan/onedrive/rprojects/LendingClub")
# MakeCredential("15900271","sSlBLcdcdMzzQdBSwn/cd/fGyQ8=")

    # start here ----
    main_window <- gtkWindow(show = FALSE)
    main_window["title"] <- "Lending Club Access"
    main_window$setDefaultSize(600, 600)

    actions <- list(
        list("AccountActs", NULL, "_Account Actions"),

        list("AccountSummary", NULL, "_Account Summary", "<control>a",
             "View your account summary", AccountSummary_cb),
        list("PendingTransfers", NULL, "_Pending Transfers", "<control>p",
             "View pending transfers", PendingTransfers_cb),
        list("PortfoliosOwned", NULL, "_Portfolios Owned", "<control>o",
             "View portfolios owned", PortfoliosOwned_cb),
        list("NotesOwned", NULL, "_Notes Owned", "<control>n",
             "View notes owned", NotesOwned_cb),
        list("DetailNotesOwned", NULL, "_Detailed Notes Owned", "<control>n",
             "Detail of notes owned", DetailedNotesOwned_cb),
        list("Quit", "gtk-quit", "_Quit", "<control>Q",
             "Quit the application", quit_cb))
    action_group <- gtkActionGroup("spreadsheetActions")
    action_group$addActions(actions, main_window)


    ui_manager <- gtkUIManager()
    ui_manager$insertActionGroup(action_group, 0)

    merge <- ui_manager$newMergeId()
    # ?gtkUIManagerAddUi
    ui_manager$addUi(merge.id = merge, path = "/", name = "menubar",
                     action = NULL, type = "menubar", top = FALSE)

    ui_manager$addUi(merge, "/menubar", "Account Actions", "AccountActs","menu", FALSE)
    ui_manager$addUi(merge, "/menubar/Account Actions", "AccountSummary", "AccountSummary", "menuitem", FALSE)
    ui_manager$addUi(merge, "/menubar/Account Actions", "PendingTransfers", "PendingTransfers", "menuitem", FALSE)
    ui_manager$addUi(merge, "/menubar/Account Actions", "NotesOwned", "NotesOwned", "menuitem", FALSE)
    ui_manager$addUi(merge, "/menubar/Account Actions", "DetailNotesOwned", "DetailNotesOwned", "menuitem", FALSE)
    ui_manager$addUi(merge, "/menubar/Account Actions", "PortfoliosOwned", "PortfoliosOwned", "menuitem", FALSE)




    ui_manager$addUi(merge, "/", "toolbar", NULL, "toolbar", FALSE)
    ui_manager$addUi(merge, path="/toolbar", name="AccountSummary", action="AccountSummary", "toolitem", FALSE)
    ui_manager$addUi(merge, "/toolbar", "PendingTransfers", "PendingTransfers", "toolitem", FALSE)
    ui_manager$addUi(merge, "/toolbar", "PortfoliosOwned", "PortfoliosOwned", "toolitem", FALSE)
    ui_manager$addUi(merge, "/toolbar", "NotesOwned", "NotesOwned", "toolitem", FALSE)
    ui_manager$addUi(merge, "/toolbar", "quit", "Quit", "toolitem", FALSE)

    menubar <- ui_manager$getWidget("/menubar")
    toolbar <- ui_manager$getWidget("/toolbar")
    main_window$addAccelGroup(ui_manager$getAccelGroup())

    statusbar <<- gtkStatusbar()
    info <<- statusbar$getContextId("info")
    statusbar$push(info, "Ready")

    notebook <<- gtkNotebook()
    notebook$setTabPos("bottom")

    vbox <- gtkVBox(homogeneous = FALSE, spacing = 0)
    vbox$packStart(menubar, expand = FALSE, fill = FALSE, padding = 0)
    vbox$packStart(toolbar, FALSE, FALSE, 0)
    vbox$packStart(notebook, TRUE, TRUE, 0)
    vbox$packStart(statusbar, FALSE, FALSE, 0)
    main_window$add(vbox)
    main_window$show()
    }
