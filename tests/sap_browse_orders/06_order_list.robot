*** Settings ***
Library            Browser
Library            OperatingSystem
Library            Collections
Resource           ../../resources/utils/browser_management.resource
Resource           ../../resources/pages/sap_browse_orders/order_overview_page.resource

*** Test Cases ***
Order List
    [Documentation]    Validate each order item has: OrderID, Customer Name, ShippedDate, OrderDate, Status
    [Tags]    smoke    order_list

    browser_management.Open SAP Fiori Orders demo site    headless=False
    order_overview_page.Wait for page elements to load

    Verify all orders have specified fields (5)
    Browser.Close Browser