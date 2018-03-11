LendingClub v2.0.0 (not yet released)
=============

Changes:

- Changed the overall API to include the lc_ prefix.  This will improve the user experience with better code completion. Original functions are deprecated but have not been removed. 
- Added unit tests via the testthat package and codecov.io. Current coverage is 55%
- Lending Club updated the folio secondary market API which affected several functions: 
    - The loanId and orderId are no longer required to purchase notes on the secondary market.  These arguments are deprecated from the  <code>FolioBuy</code> and <code>FolioSell</code> functions. The change is non-breaking but the function will return a warning if these arguments are passed in the function call.
    - The <code>FolioOrders</code> function was added to see either buy or sell orders submitted in the current month. 
    - The <code>FolioListing</code> function now able to filter the results by the time elapsed since the note was 
updated. The function executes much faster.
- Bug fixes


LendingClub v1.0.4 (Release date: 2018-01-29)
==============

Changes:

- New Function: Dashboard() which knits an html with summary statistics.
- New Function: AccountSummary_() to replace AccountSummary(). 
- Added additional S3 classes for ListedLoans and AccountSummary allowing for print and summary methods.
- Deprecated AccountSummary()


LendingClub v1.0.3 (Release date: 2017-06-04)
==============