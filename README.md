# Lending Club  

## A pakcage being built to access the Lending Club API

*Available Functions:*

- AddFunds
- AccountSummary
- AvailableCash
- CreatePortfolio
- DetailNotesOwned
- ListedLoans
- NotesOwned
- PendingTransfers
- PortfoliosOwned
- TransferFunds
- WithdrawFunds
- CancelTransfers
- FolioSell
- FolioBuy

*Planned Functions:*

- SubmitOrder
- FolioListing




### A Brief How-To
To use this package, you'll first need to create a credential. This credential 
will be saved to the global environment and referenced by every other function. 
Use the MakeCredential() function and pass it your investorID number 
and your API key. You can find the InvestorID on your account summary page and 
the API key on the Account Settings page. 

```
MakeCredential(investorID, APIkey)
ListedLoans()
```

