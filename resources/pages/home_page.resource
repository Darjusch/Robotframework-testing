*** Settings ***
Resource    ../keywords/common.resource


*** Variables ***
${TITLE_TEXT}           Example Domain
${GET_STARTED_BTN}      css=[data-testid="get-started"], css=a[href="/start"]    # robust: data-testid bevorzugen


*** Keywords ***
Home Page Should Be Visible
    Get Title    ==    ${TITLE_TEXT}

Click Get Started
    Wait For Elements State    ${GET_STARTED_BTN}    visible    5s
    Click    ${GET_STARTED_BTN}
