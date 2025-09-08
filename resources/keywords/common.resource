*** Keywords ***
Get Title == ${expected}
    ${title}=    Get Title
    Should Be Equal    ${title}    ${expected}
