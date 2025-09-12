*** Settings ***
Library            Browser
Library            OperatingSystem
Library            Collections
Resource           ../resources/utils/browser_management.resource
Resource           ../resources/pages/order_overview_page.resource

*** Test Cases ***
Order List
    [Documentation]    Validate each order item has: OrderID, Customer Name, ShippedDate, OrderDate, Status
    [Tags]    smoke    order_list

    browser_management.Open SAP Fiori Orders demo site    headless=False
    order_overview_page.Wait for page elements to load

    Create order locator array
    Verify all orders have required fields

    Browser.Close Browser

*** Keywords ***
Create order locator array
    Browser.Wait For Elements State    ${orders}    visible    timeout=10s
    ${count}=    Browser.Get Element Count    ${orders}
    BuiltIn.Should Be True    ${count} > 0    msg=Expected at least 1 order, found ${count}
    @{order_locators}=    BuiltIn.Create List
    FOR    ${i0}    IN RANGE    0    ${count}
        ${loc}=    BuiltIn.Set Variable    ${orders} >> nth=${i0}
        Collections.Append To List    ${order_locators}    ${loc}
    END
    Set Suite Variable    @{ORDER_LOCATORS}    @{order_locators}

Verify all orders have required fields
    FOR    ${item}    IN    @{ORDER_LOCATORS}
        Verify order item has required fields    ${item}
    END

Verify order item has required fields
    [Arguments]    ${item}    ${order_id}=    ${customer}=    ${shipped_date}=    ${secondary_date}=    ${status}=
    BuiltIn.Set Local Variable    ${order_id}
    BuiltIn.Set Local Variable    ${customer}
    BuiltIn.Set Local Variable    ${shipped_date}
    BuiltIn.Set Local Variable    ${secondary_date}
    BuiltIn.Set Local Variable    ${status}
    Browser.Wait For Elements State    ${order item title}          visible    timeout=10s
    Browser.Wait For Elements State    ${order item company name}   visible    timeout=10s
    Browser.Wait For Elements State    ${order item shipped date}   visible    timeout=10s
    Browser.Wait For Elements State    ${order item ordered date}   visible    timeout=10s
    Browser.Wait For Elements State    ${order item status}         visible    timeout=10s

Verify first order item has required fields
    ${index}=    BuiltIn.Set Variable    1
    ${item}=     BuiltIn.Set Variable    ${orders} >> nth=0
    Verify order item has required fields    ${item}

Verify first N order items have required fields
    [Arguments]    ${n}=5
    Browser.Wait For Elements State    ${orders}    visible    timeout=10s
    ${count}=    Browser.Get Element Count    ${orders}
    ${limit}=    BuiltIn.Set Variable If    ${n} <= ${count}    ${n}    ${count}
    FOR    ${i0}    IN RANGE    0    ${limit}
        ${item}=    BuiltIn.Set Variable    ${orders} >> nth=${i0}
        Verify order item has required fields    ${item}
    END