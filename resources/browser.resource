*** Settings ***
Library    Browser

*** Keywords ***
Open Browser To Base URL
    # Uses variables from your YAML: ${BROWSER}, ${HEADLESS}, ${BASE_URL}
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width':1280,'height':800}
    New Page       ${BASE_URL}

Close Browser Session
    Close Browser