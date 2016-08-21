AccountSummary_cb <- function(widget, window) {
    statusbar$push(info, "Loading")
    resp<-AccountSummary()$content
    load_dataframe(resp, "Account Summary")
    statusbar$push(info, "Ready")
    }

PendingTransfers_cb<- function(widget, windowr){
    statusbar$push(info, "Loading")
    resp<- PendingTransfers()$content
    load_dataframe(resp, "Pending Transfers")
    statusbar$push(info, "Ready")
    }

PortfoliosOwned_cb<- function(widget, window){
    statusbar$push(info, "Loading")
    resp<- PortfoliosOwned()$content
    load_dataframe(resp, "Portfolios Owned")
    statusbar$push(info, "Ready")
    }

NotesOwned_cb<- function(widget, window){
    statusbar$push(info, "Loading")
    resp<- NotesOwned()$content
    load_dataframe(resp, "Notes Owned")
    statusbar$push(info, "Ready")
    }

DetailedNotesOwned_cb<- function(widget, window){
    statusbar$push(info, "Loading")
    resp<- DetailedNotesOwned()$content
    load_dataframe(resp, "Detail Notes Owned")
    statusbar$push(info, "Ready")
}

quit_cb <- function(widget, window) window$destroy()
