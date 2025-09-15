*** Settings ***
Library            Browser
Library            OperatingSystem
Resource           ../resources/utils/browser_management.resource
Resource           ../resources/pages/order_overview_page.resource
Resource           ../resources/pages/order_status_page.resource
Resource           ../resources/pages/sorting_orders_page.resource
Suite Setup        Suite Setup
Suite Teardown     Suite Teardown

*** Test Cases ***
Verify group titles are sorted alphabetically by customer name
    sorting_orders_page.Sort by customer name
    @{group_titles}=    sorting_orders_page.Get sorted group titles
    @{expected}=    Evaluate    sorted(${group_titles})
    Should Be Equal    ${group_titles}    ${expected}


*** Keywords ***
Suite Setup
    [Documentation]    Setup browser and navigate to SAP Fiori Orders demo site
    browser_management.Open SAP Fiori Orders demo site    headless=False
    order_overview_page.Wait for page elements to load

Suite Teardown
    [Documentation]    Close browser after all tests
    Browser.Close Browser

