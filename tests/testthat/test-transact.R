library(LendingClub)
context("Transactions")

# skip_on_cran()

test_that("Listed Loans",{
    
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    listed<- ListedLoans(showAll=T, LC_CRED)
    expect_s3_class(listed, "ListedLoans")
    expect_is(listed$content, "list")
})


test_that("FolioListing",{
    
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    listed<- FolioListing(updatedSince=30, LC_CRED)
    expect_s3_class(listed, "folio_api")
    expect_s3_class(listed, "LendingClub_api")
    expect_is(listed$content, "data.frame")
})

test_that("SubmitOrder", {
    expect_error(SubmitOrder(123,456, LC_CRED="abc"), "Please create the credential object .*")
    
    
})


test_that("FolioOrders", {
    expect_error(FolioOrders("abc", orderType = "SELL", status = NULL, LC_CRED), "includeDetails is not logical")
    expect_error(FolioOrders(T, orderType= NULL, status = NULL, LC_CRED), "orderType not spec.*")
    expect_error(FolioOrders(T, orderType= "fail", status = NULL, LC_CRED), "orderType should be .*")
    
    
    expect_error(FolioOrders(T, orderType= "SELL", status= "fail", LC_CRED), "status type is not valid")
    
    expect_error(FolioOrders(TRUE, orderType= "SELL", status= NULL, LC_CRED= "abc"), "Please create the credential object .*")
    
})

test_that("FolioBuy", {
    LC_CRED<- MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    expect_error(
        expect_warning(
            FolioBuy(loanId = "abc", orderId = "def", noteId = 1234, LC_CRED), 
            "The loanId variable"))
})