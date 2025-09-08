*** Settings ***
Resource          ../../resources/browser.resource
Resource          ../../resources/keywords/worklist_keywords.resource
Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Tags         worklist    smoke

*** Test Cases ***
Worklist page loads with default dataset
    Open worklist
    Worklist shows expected columns    Order ID    Customer    Status    Net Amount
    Worklist has at least N rows       1

