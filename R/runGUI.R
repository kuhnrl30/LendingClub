#' Open the Lending Club GUI
#'
#'  Opens a GUI capable of retrieving Lending Club account data and to
#'  execute transactions.
#' @export
runGUI <- function() {
    appDir <- system.file("shiny-examples", "myapp", package = "LendingClub")
    if (appDir == "") {
        stop("Could not find example directory. Try re-installing `LendingClub`.", call. = FALSE)
    }

    # shiny::runApp(appDir, display.mode = "normal")
    shiny::runApp(appDir, host="127.0.0.1",port=5209, launch.browser = T, display.mode = "normal")
    }


