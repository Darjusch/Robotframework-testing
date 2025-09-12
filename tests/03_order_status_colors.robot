*** Settings ***
Library            Browser
Library            OperatingSystem
Resource           ../resources/utils/browser_management.resource
Resource           ../resources/pages/order_overview_page.resource
Resource           ../resources/pages/order_status_page.resource
Suite Setup        Suite Setup
Suite Teardown     Suite Teardown

*** Test Cases ***
Verify Order Status Color Mapping
    [Documentation]    Verify that order status text matches the correct CSS color classes
    [Tags]    status    colors    ui
    Log    Testing order status color mapping
    
    # Wait for orders to load
    Wait for page elements to load
    
    # Get initial order count
    ${order_count}=    order_status_page.Get order count
    Should Be True    ${order_count} > 0    msg=No orders found to test
    
    Log    Found ${order_count} orders to verify
    
    # Verify all order statuses have correct color mapping
    order_status_page.Verify all order statuses have correct colors
    
    Log    All order status-color mappings verified successfully

Verify Status Text Values
    [Documentation]    Verify that status texts are valid expected values
    [Tags]    status    validation    ui
    
    # Get all status texts
    ${all_statuses}=    order_status_page.Get all order statuses
    ${unique_statuses}=    Collections.Remove Duplicates    ${all_statuses}
    
    # Verify we have expected status types
    FOR    ${status}    IN    @{unique_statuses}
        Should Be True    "${status}" in ["In time", "Urgent", "Too late"]    msg=Unexpected status text: "${status}"
    END
    
    Log    All status texts are valid: ${unique_statuses}


*** Keywords ***
Suite Setup
    [Documentation]    Setup browser and navigate to SAP Fiori Orders demo site
    browser_management.Open SAP Fiori Orders demo site    headless=False
    order_overview_page.Wait for page elements to load

Suite Teardown
    [Documentation]    Close browser after all tests
    Browser.Close Browser

