library(LendingClub)
context("Account Management")

skip_on_cran()

test_that("Account Summary", {
    
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    acctsum<- AccountSummary_(LC_CRED)
    expect_s3_class(acctsum, "AccountSummary")
    expect_type(acctsum$content, "list")
    expect_error(AccountSummary_(LC_CRED="abc"))
    expect_warning(AccountSummary(LC_CRED))
    })
 
test_that("Available Cash", {
    
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
    })


