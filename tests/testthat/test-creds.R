library(LendingClub)
context("Account Summary")

test_that("Lending Club Credential",
          if (!exists("LC_CRED")) {
              expect_error(AccountSummary_())
          } else {
              expect_s3_class(AccountSummary_(), "AccountSummary")
          }

          
)

