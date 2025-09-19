*** Settings ***
Library            Browser
Library            String
Variables          ../../locators/sap_trial/launchpad.yaml
Variables          ../../locators/sap_trial/login.yaml
Resource           ../../utils/browser_management.resource


*** Keywords ***
Login
    [Arguments]     ${username}     ${password}
    Open SAP Trial LAUNCHPAD site    headless=${True}
    Wait For Elements State    ${username input}    visible    10s
    Clear Text    ${username input}
    Fill Text    ${username input}    ${username}
    Click    ${login button}
    Wait For Elements State    ${password input}    visible    10s
    Fill Text    ${password input}    ${password}
    Click    ${login button}
    Sleep    1s
    # ${finance_locator}=    Format String    ${launchpad.space_tile_by_name_contains}    SPACE_NAME=Finance
    # Wait For Elements State    ${finance_locator}    visible    30s

