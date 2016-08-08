CheckCred<- function(){
if (!exists("LC_CRED", envir= .GlobalEnv)){
    stop("Please create the credential with MakeCredential()",
         call.= FALSE)
}
    LC_CRED
}
