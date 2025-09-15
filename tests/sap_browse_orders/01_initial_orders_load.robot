*** Settings ***
Library            Browser
Library            OperatingSystem
Resource           ../../resources/utils/browser_management.resource
Resource           ../../resources/pages/sap_browse_orders/order_overview_page.resource

*** Test Cases ***
Initial Orders Load
    [Documentation]    Verify that Title, Searchbar, Filter, Sorting, and Orderlist elements appear on page load
    [Tags]    smoke    initial_load
    
    # Set up browser and navigate to the application
    # Note: Replace with your actual application URL
    browser_management.Open SAP Fiori Orders demo site    headless=False
    
    # Wait for all page elements to load
    order_overview_page.Wait for page elements to load
    
    # Verify all elements are present
    order_overview_page.Verify page elements are present
    
    Browser.Close Browser
