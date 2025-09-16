*** Settings ***
Library            Browser    timeout=20s
Library            DateTime
Library    ../../venv/lib/python3.12/site-packages/robot/libraries/String.py
Variables          ../locators/sap_browse_orders/order_overview.yaml
Variables          ../locators/sap_trial/launchpad.yaml

*** Keywords ***
Open SAP Fiori Orders demo site
    [Arguments]    ${browser}=chromium    ${headless}=${False}    ${slowMo}=0:00:00.5
    ...        ${viewport}={"width": 1200, "height": 800}    ${url}=https://sapui5.hana.ondemand.com/test-resources/sap/m/demokit/orderbrowser/webapp/test/mockServer.html?sap-ui-theme=sap_horizon#
    Set up browser    url=${url}    browser=${browser}    headless=${headless}    slowMo=${slowMo}    viewport=${viewport}
    Browser.Wait For Elements State    ${title total orders}    visible    message=Orders title didn't load correctly

Open SAP Trial LAUNCHPAD site
    [Arguments]    ${browser}=chromium    ${headless}=${False}    ${slowMo}=0:00:00.5
    ...        ${viewport}={"width": 1200, "height": 800}    ${url}=https://my426318.s4hana.cloud.sap/ui?sap-language=EN&help-mixedLanguages=false&help-autoStartTour=PR_28A0E50CC77DAF91#Shell-home
    Set up browser    url=${url}    browser=${browser}    headless=${headless}    slowMo=${slowMo}    viewport=${viewport}
    Sleep    5s

Set up browser
    [Arguments]    ${url}    ${browser}=chromium    ${headless}=False    ${slowMo}=0:00:00.5
    ...        ${viewport}={"width": 1200, "height": 800}
    Browser.New Browser    ${browser}    ${headless}    slowMo=${slowMo}
    
    ${har_config}=
        ...    BuiltIn.Create Dictionary
        ...    path=${OUTPUT_DIR}${/}har.file
        ...    omitContent=False

    ${vid_config}=
        ...    BuiltIn.Create Dictionary
        ...    dir=${OUTPUT_DIR}${/}video-recordings
        ...    size={"width": 1200, "height": 800}
    
    Browser.New Context    viewport=${viewport}    recordHar=${har_config}    recordVideo=${vid_config}
    Browser.New Page    url=${url}    
