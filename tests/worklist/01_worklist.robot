*** Settings ***
Resource    ../../resources/browser.resource
Resource    ../../resources/pages/worklist_page.resource
Library     DataDriver

Suite Setup      Open Browser To Worklist URL
Suite Teardown   Close Browser Session
Test Template    Verify Worklist Row
Test Tags        worklist    smoke

*** Test Cases ***
Verify order '${order_id}' for '${customer}' Default UserData

*** Keywords ***
Verify Worklist Row
    [Arguments]    ${order_id}    ${customer}    ${status}    ${shipped_text}    ${secondary_date}
    Wait For Worklist Ready
    Click    ${LIST} >> css=.sapMLIB:has-text("Order ${order_id}")
    # Assertions – adapt selectors as needed
    Should Not Be Empty    ${customer}        msg=Customer field is missing
    Get Element            css=:has-text("${customer}")
    Should Not Be Empty    ${status}          msg=Status field is missing
    Get Element            css=:has-text("${status}")
    Should Not Be Empty    ${shipped_text}    msg=Shipped info is missing
    Get Element            css=:has-text("${shipped_text}")
    IF    '${secondary_date}' != ''
        Get Element        css=:has-text("${secondary_date}")
    END