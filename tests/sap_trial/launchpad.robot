*** Settings ***
Library            Browser
Resource           ../../resources/utils/browser_management.resource
Resource           ../../resources/pages/sap_trial/launchpad_page.resource
Resource           ../../resources/pages/sap_trial/login_page.resource
Suite Setup        Login And Wait
Suite Teardown     Close Browser

*** Test Cases ***
Create Sales Order
    Open Space    Sales
    Create Sales Order
    

*** Keywords ***
Login And Wait
    Login
    Sleep    3
