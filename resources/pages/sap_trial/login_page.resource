*** Settings ***
Library            Browser
Library            String
Variables          ../../locators/sap_trial/launchpad.yaml
Variables          ../../locators/sap_trial/login.yaml
Resource           ../../utils/browser_management.resource


*** Keywords ***
Login
    Open SAP Trial LAUNCHPAD site    headless=${True}
    Log    Page loaded, looking for username field
    Wait For Elements State    ${username input}    visible    10s
    Log    Username field found, clearing and filling
    Clear Text    ${username input}
    Fill Text    ${username input}    darjusch.schrand@old-rabbits-consulting.de
    Log    Username filled, clicking login button
    Click    ${login button}
    Log    Login button clicked, waiting for password field
    Wait For Elements State    ${password input}    visible    10s
    Log    Password field found, filling password
    Fill Text    ${password input}    SeCrEt123!
    Log    Password filled, clicking login button
    Click    ${login button}
    Log    Final login button clicked, waiting for launchpad
    Sleep    1s
    ${finance_locator}=    Format String    ${launchpad.space_tile_by_name_contains}    SPACE_NAME=Finance
    Wait For Elements State    ${finance_locator}    visible    30s

