#' Creates an HTML dashboard 
#'
#' Knits a document with summary statistics needed to evaluate an account. 
#'
#' @param filename Name of the file to create 
#' @param ID User's ID from the Account Summary page
#' @param out_dir Directory where to save the html file  
#' @param key User's API key from the account settings page
#' @param ... Arguments passed on to rmarkdown::render
#' @export

Dashboard<- function(filename = "Dashboard.html", out_dir= getwd(), ID= LC_CRED$investorID, key= LC_CRED$key, ...){
    
    list.of.packages <- c("ggplot2", "knitr", "rmarkdown", "dplyr")
    new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]
    if(length(new.packages)) {
        message("installing required packages")
        install.packages(new.packages)
        }
    
    
    fpath <- system.file("Dashboard.Rmd", package="LendingClub")
    
    rmarkdown::render(input= fpath, 
                      output_file= filename, 
                      output_dir= out_dir, 
                      params= list(investorID= ID, APIkey = key), 
                      ...)
    
    result<- paste0(out_dir, "/",filename)
    
    # probe for viewer option then fall back to browseURL
    viewer <- getOption("viewer")
    
    if (!is.null(viewer)) {
        file.copy(result, file.path(tempdir(), filename))
        viewer(file.path(tempdir(), filename)) }
    else
        utils::browseURL(result)
        }