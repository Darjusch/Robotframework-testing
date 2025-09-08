*** Settings ***
Resource    ../pages/worklist_page.resource

*** Keywords ***
Open worklist
    Open worklist page
    Wait for worklist ready

Worklist shows expected columns
    [Arguments]    @{columns}
    Ensure columns exist    @{columns}

Worklist has at least N rows
    [Arguments]    ${min}
    ${count}=    Get row count
    Should Be True    ${count} >= ${min}    Expected ≥ ${min}, got ${count}