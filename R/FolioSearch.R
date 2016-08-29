# ---------------
params<- list(search_from_rate=0.04,
              search_to_rate=0.31,
              fil_search_term="term_36",
              fil_search_term="term_60",
              search_loan_term="term_36",
              search_loan_term="term_60",
              opr_min=0.00,
              opr_max="Any",
              loan_status="loan_status_issued",
              loan_status="loan_status_current",
              never_late="true",
              remp_min=1,
              remp_max=20,
              askp_min=0.00,
              askp_max=25.00,
              credit_score_min=600,
              credit_score_max=850,
              ytm_min="Any",
              ytm_max="Any",
              credit_score_trend="UP",
              credit_score_trend="DOWN",
              credit_score_trend="FLAT",
              markup_dis_min=-100,
              markup_dis_max=15,
              ona_min=25,
              ona_max="Any"
              )

# ------------
library(httr)
library(RCurl)
# base<- "https://www.lendingclub.com/foliofn/tradingInventory.action?mode=search"
# a<-httr::GET(base, query=params)

myURL<-"https://www.lendingclub.com/foliofn/browseNotesAj.action?&sortBy=opa&dir=asc&startindex=0&newrdnnum=60006208&pagesize=15"


ref<- "https://www.lendingclub.com/foliofn/tradingInventory.action?mode=search&search_from_rate=0.04&search_to_rate=0.31&fil_search_term=term_36&fil_search_term=term_60&search_loan_term=term_36&search_loan_term=term_60&opr_min=0.00&opr_max=Any&loan_status=loan_status_issued&loan_status=loan_status_current&never_late=true&remp_min=1&remp_max=20&askp_min=0.00&askp_max=25.00&credit_score_min=600&credit_score_max=850&ytm_min=Any&ytm_max=Any&credit_score_trend=UP&credit_score_trend=DOWN&credit_score_trend=FLAT&markup_dis_min=-100&markup_dis_max=15&ona_min=25&ona_max=Any"

a<- RCurl::getURL(myURL)


# --------------------
OpenSession<- function(email,password){
    handle<- "https://www.lendingclub.com/account/login.action"
    PAGE_SESSION<<- html_session(handle)

    pgform<- html_form(PAGE_SESSION)[[1]]
    filledform<- set_values(pgform,
                            login_email=email,
                            login_password=password)
    submit_form(PAGE_SESSION,filledform)
}


OpenSession("kuhnrl30@gmail.com","Mar162016")

html_sesion()

library(rvest)
myURL2<-"https://www.lendingclub.com/foliofn/tradingInventory.action?mode=search&search_from_rate=0.0&search_to_rate=0.31&fil_search_term=term_36&fil_search_term=term_60&search_loan_term=term_36&search_loan_term=term_60&opr_min=0.00&opr_max=Any&loan_status=loan_status_issued&loan_status=loan_status_current&never_late=true&remp_min=1&remp_max=20&askp_min=20.00&askp_max=25.00&credit_score_min=600&credit_score_max=850&ytm_min=15&ytm_max=Any&credit_score_trend=UP&credit_score_trend=DOWN&credit_score_trend=FLAT&markup_dis_min=-100&markup_dis_max=15&ona_min=25&ona_max=Any"


read_html(myURL2) %>%
    html_nodes("table")
