*** Settings ***
Library         Browser    timeout=${DEFAULT_TIMEOUT}
Variables       ../config_vars.py    # optional, weglassen wenn nicht genutzt


*** Variables ***
${DEFAULT_CONTEXT_ARGS}     viewport={'width':1280,'height':800}


*** Keywords ***
Open Browser To Base URL
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    ${DEFAULT_CONTEXT_ARGS}
    New Page    ${BASE_URL}

Close Browser
    Close All Browsers
