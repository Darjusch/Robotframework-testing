*** Settings ***
Library            Browser
Resource           ../../resources/utils/browser_management.resource
Resource           ../../resources/pages/sap_trial/launchpad_page.resource
Resource           ../../resources/pages/sap_trial/login_page.resource
Resource           ../../resources/pages/sap_trial/sales_page.resource
Suite Setup        Login And Wait
Suite Teardown     Close Browser

*** Test Cases ***
Create Sales Order
    Open Space    Sales
    Enter Basic Sales Order Data
    Specify The Customer
    Add Order Line Item
    Create Sales Order
    Verify Sales Order Notification

*** Keywords ***
Login And Wait
    Login
    Sleep    3
