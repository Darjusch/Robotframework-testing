*** Settings ***
Library    Browser
Variables   ../config/dev.yaml


*** Keywords ***
#TODO Refactor to use url input
Open Browser To Worklist URL
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width':1280,'height':800}
    New Page       ${WORKLIST_URL}

Close Browser Session
    Close Browser