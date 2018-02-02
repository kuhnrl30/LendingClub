library(LendingClub)
context("MakeCredential")

test_that("Lending Club Credential",
          if (!exists("LC_CRED")) {
              expect_error(AccountSummary_())
              expect_error(AccountSummary())
              expect_error(AddFunds())
              expect_error(AvailableCash())
              expect_error(CancelTransfer())
              expect_error(CreatePortfolio())
              expect_error(Dashboard())
              expect_error(DetailedNotesOwned())
              expect_error(FolioSell())
              expect_error(FolioBuy())
              expect_error(ListedLoans())
              expect_error(NotesOwned())
              expect_error(PendingTransfers())
              expect_error(PortfoliosOwned())
              expect_error(SubmitOrder())
              expect_error(WithdrawFunds())
          } else {
              expect_s3_class(AccountSummary_(), "AccountSummary")
              expect_warning(AccountSummary())
          }
    )

test_that("Make Credential", {
          expect_s3_class( MakeCredential("x","y"), "LendingClub_credential")
          # expect_output( CheckCred("a"), "a")
          expect_error( CheckCred(), "Please create the credential object.*")
          })
