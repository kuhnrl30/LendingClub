# Lending Club  

## A pakcage built to access the Lending Club API

### List of Functions  
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
- SubmitOrder


## A Brief How-To 
To use this package, you'll first need to create a credential from your account 
number and API key. This credential will be saved to the global environment and 
referenced by every other function. Use the MakeCredential() function and pass 
it your investorID number and your API key. You can find the InvestorID on your 
account summary page and the API key on the Account Settings page. 

```
MakeCredential(investorID, APIkey)
ListedLoans()
```

