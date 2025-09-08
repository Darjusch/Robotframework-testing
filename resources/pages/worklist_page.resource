*** Settings ***
Library    Browser

*** Variables ***
${TABLE}    role=table

*** Keywords ***
Open worklist page
    New Page    ${WORKLIST_URL}
    Wait for worklist ready

Wait for worklist ready
    Wait For Elements State    ${TABLE}    visible    10s

Ensure columns exist
    [Arguments]    @{names}
    FOR    ${n}    IN    @{names}
        # You can interpolate the variable directly in the selector:
        Get Element    role=columnheader[name="${n}"]
    END

Get row count
    ${rows}=    Get Element Count    role=row
    [Return]    ${rows}