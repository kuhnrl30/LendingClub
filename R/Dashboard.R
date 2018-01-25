#' Creates an HTML dashboard 
#'
#' Knits a document with summary statistics needed to evaluate an account. 
#'
#' @param filename Name of the file to create 
#' @param investorID User's ID from the Account Summary page
#' @param out_dir Directory where to save the html file  
#' @param APIkey User's API key from the account settings page
#' @param ... Arguments passed on to rmarkdown::render
#' @export

Dashboard<- function(filename = "Dashboard.html", out_dir= getwd(), ID= LC_CRED$investorID, key= LC_CRED$key, ...){
    fpath <- system.file("Dashboard.Rmd", package="LendingClub")
    rmarkdown::render(input= fpath, output_file= filename, output_dir= out_dir, params=list(investorID= ID, APIkey = key), ...)
    result<- paste0(out_dir, "/",filename)
    
    # probe for viewer option then fall back to browseURL
    viewer <- getOption("viewer")
    if (!is.null(viewer)) {
        file.copy(result, file.path(tempdir(), filename))
        viewer(file.path(tempdir(), filename)) }
    else
        utils::browseURL(result)
    
    # browseURL(file.path(paste0(out_dir, "/", filename)))
    }