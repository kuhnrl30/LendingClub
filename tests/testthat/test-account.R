library(LendingClub)
context("Account Management")

# skip_on_cran()

test_that("AccountSummary_", {
    
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    LC_CRED_ERR<- MakeCredential(
        investorID= "123",
        APIkey= "456")
    
    acctsum<- AccountSummary_(LC_CRED)
    expect_s3_class(acctsum, "AccountSummary")
    expect_type(acctsum$content, "list")
    expect_error(AccountSummary_(LC_CRED="abc"))
    expect_error(AccountSummary_(LC_CRED_ERR))
    })
 
test_that("AccountSummary",{
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    

    
    expect_warning(acctsum<-AccountSummary(LC_CRED))
    expect_s3_class(acctsum, "LendingClub_api")   
})


test_that("AvailableCash", {
    
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    availcash<- AvailableCash(LC_CRED)
    expect_type(availcash,"list")
    expect_s3_class(availcash, "LendingClub_api")
    })
 
test_that("Notes owned", {
    
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    notes<- NotesOwned(LC_CRED)
    expect_is(notes$content, "data.frame")
    
    # Detailed notes owned
    d_notes<- DetailedNotesOwned(LC_CRED)
    expect_s3_class(d_notes,"holdings")
    expect_is(d_notes$content, "data.frame")
    expect_is(summary(d_notes), "data.frame")
    })


test_that("PortfoliosOwned", {
    
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    ports<- PortfoliosOwned(LC_CRED)
    expect_type(ports$content,"list")
    expect_s3_class(ports, "LendingClub_api")
})


test_that("CreatePortfolio", {
    expect_error(CreatePortfolio("abc", LC_CRED="abc"), "Please create the credential object .*") 
})

test_that("PendingTransfers", {
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    expect_error(PendingTransfers(LC_CRED="abc"), "Please create the credential object .*")
    xfer<- PendingTransfers(LC_CRED)
    expect_is(xfer$content, "data.frame")
    expect_s3_class(xfer, "LendingClub_api")
})
