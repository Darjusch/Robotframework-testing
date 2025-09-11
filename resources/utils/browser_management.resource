*** Settings ***
Library            Browser    timeout=20s
Variables          ../locators/order_overview.yaml


*** Keywords ***
Open SAP Fiori Orders demo site
    [Arguments]    ${browser}=chromium    ${headless}=${False}    ${slowMo}=0:00:00.5
    ...        ${viewport}={"width": 1200, "height": 800}    ${url}=https://sapui5.hana.ondemand.com/test-resources/sap/m/demokit/orderbrowser/webapp/test/mockServer.html?sap-ui-theme=sap_horizon#
    Set up browser    url=${url}    browser=${browser}    headless=${headless}    slowMo=${slowMo}    viewport=${viewport}
    Browser.Wait For Elements State    ${title total orders}    visible    message=Orders title didn't load correctly

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
        ...    dir=${OUTPUT_DIR}
    Browser.New Context    viewport=${viewport}    recordHar=${har_config}    recordVideo=${vid_config}
    Browser.New Page    url=${url}    
