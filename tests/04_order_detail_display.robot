*** Settings ***
Library            Browser
Library            OperatingSystem
Resource           ../resources/utils/browser_management.resource
Resource           ../resources/pages/order_overview_page.resource
Resource           ../resources/pages/order_details_page.resource

*** Test Cases ***
Order Detail Display
    [Documentation]    Open the first order and verify details: Title, Customer details, Shipping address
    [Tags]    smoke    order_details

    browser_management.Open SAP Fiori Orders demo site    headless=False
    order_overview_page.Wait for page elements to load
    order_overview_page.Verify page elements are present

    Browser.Click    ${orders} >> nth=1

    order_details_page.Wait for order details to load
    order_details_page.Verify order details are visible

    Browser.Close Browser