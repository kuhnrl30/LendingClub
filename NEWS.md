LendingClub v1.0.5 (Release date: 2018-01-29)
==============

Changes:  

- Lending Club updated the folio secondary market API.  Several arguments in the FolioBuy and FolioSell 
functions are no longer required and are deprecated.
- FolioListing function now able to filter the esults by the time elapsed since the note was 
updated. The function executes much faster.
- Fixed typos in the Dashboard output.

LendingClub v1.0.4 (Release date: 2018-01-29)
==============

Changes:

- New Function: Dashboard() which knits an html with summary statistics.
- New Function: AccountSummary_() to replace AccountSummary(). 
- Added additional S3 classes for ListedLoans and AccountSummary allowing for print and summary methods.
- Deprecated AccountSummary()


LendingClub v1.0.3 (Release date: 2017-06-04)
==============