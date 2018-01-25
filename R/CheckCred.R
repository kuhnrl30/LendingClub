CheckCred<- function(x){

# If LC_CRED is null, then a value was not passed in the calling
# function. If it isn't null, then return it.
if(!is.null(x)){
    return(x)
    }

# If LC_CRED is null, then check if it exists in the global environment
if (!exists("LC_CRED", envir= .GlobalEnv)){
    stop("Please create the credential object LC_CRED using the  MakeCredential() function",
         call.= FALSE)
}
    get("LC_CRED")
}
