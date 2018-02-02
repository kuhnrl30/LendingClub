library(LendingClub)
context("Transfers")

test_that("Add Funds", {
          expect_error(AddFunds(25, "LOAD_WEEKLY"),"start required for future transfers")
          expect_error(AddFunds("A","LOAD_ONCE"), "amount must be numeric")
          expect_error(AddFunds(25, "Foo"), "freq value does not match acceptable values")
    })
