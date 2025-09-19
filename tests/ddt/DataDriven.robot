*** Settings ***
Library             DataDriver
Library            Browser
Library            String
Resource           ../../resources/pages/sap_trial/login_page.resource
Resource           ../../resources/utils/browser_management.resource
Variables          ../../resources/locators/sap_trial/launchpad.yaml
Variables          ../../resources/locators/sap_trial/login.yaml
Test Template       Invalid Login

*** Test Cases ***
Login with user '${username}' and password '${password}'    Default    UserData


*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
