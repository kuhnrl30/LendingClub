library(LendingClub)
context("Account Management")

skip_on_cran()

test_that("Lending Club Credential",{
    
    
    LC_CRED<- MakeCredential(investorID= as.character(Sys.getenv("investorId", names=T)), 
                             APIkey= Sys.getenv("APIkey", "", names=T))
    
    # Account Summary ----
    acctsum<- AccountSummary_()
    expect_s3_class(acctsum, "AccountSummary")
    expect_type(acctsum$content, "list")
    expect_error(AccountSummary_(LC_CRED="abc"))
    expect_warning(AccountSummary())
    
    # Available Cash ----
    availcash<- AvailableCash()
    expect_type(availcash,"list")
    expect_s3_class(availcash, "LendingClub_api")
    
    # Notes owned ----
    notes<- NotesOwned()
    expect_is(notes$content, "data.frame")
    
    # Detailed notes owned
    d_notes<- DetailedNotesOwned()
    expect_s3_class(d_notes,"holdings")
    expect_is(d_notes$content, "data.frame")
    
}
)


