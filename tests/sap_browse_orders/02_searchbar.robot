*** Settings ***
Library            Browser
Library            OperatingSystem
Resource           ../../resources/utils/browser_management.resource
Resource           ../../resources/pages/sap_browse_orders/order_overview_page.resource
Resource           ../../resources/pages/sap_browse_orders/searchbar_page.resource
Suite Setup        Suite Setup
Suite Teardown     Suite Teardown

*** Test Cases ***
Order Search Functionality With No Matching Orders
    [Documentation]    Test the search functionality in the order overview page with no matching orders
    [Tags]    search    functionality
    Log    Testing search functionality
    
    searchbar_page.Enter search term    qwertzuiopasdfghjklyxcvbnm
    searchbar_page.Verify no matching orders banner is present

Order Search Functionality With Matching Orders
    [Documentation]    Test the search functionality in the order overview page with matching orders
    [Tags]    search    functionality
    searchbar_page.Reset search
    # Wait for orders to load before getting initial count
    Sleep    3s
    
    # Get initial order count
    ${initial_count}=    searchbar_page.Get order count from title
    Log    Initial order count: ${initial_count}
    
    # Perform search with a term that should match some orders
    searchbar_page.Enter search term    Berglunds
    
    # Verify search results are correct
    ${title_count}    ${item_count}=    searchbar_page.Verify matching orders are present
    Log    Search returned ${title_count} orders in title and ${item_count} items in list
    
    # Verify search reduced the number of results (optional verification)
    Should Be True    ${title_count} <= ${initial_count}    msg=Search should not increase order count
    
    # Test reset functionality
    searchbar_page.Reset search
    ${reset_count}=    searchbar_page.Get order count from title
    Should Be Equal As Integers    ${reset_count}    ${initial_count}
    ...    msg=Reset should restore original count (${reset_count} vs ${initial_count})
    
    Log    Search functionality test completed successfully


*** Keywords ***
Suite Setup
    [Documentation]    Setup browser and navigate to SAP Fiori Orders demo site
    browser_management.Open SAP Fiori Orders demo site    headless=False
    order_overview_page.Wait for page elements to load

Suite Teardown
    [Documentation]    Close browser after all tests
    Browser.Close Browser
