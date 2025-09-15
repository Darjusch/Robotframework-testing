*** Settings ***
Library            Browser
Variables          ../locators/order_overview.yaml
Variables          ../locators/searchbar.yaml

*** Keywords ***
Wait for page elements to load
    [Documentation]    Wait for all main elements of the order overview page to be visible
    Browser.Wait For Elements State    ${title total orders}    visible    timeout=10s
    Browser.Wait For Elements State    ${order_searchbar_input_field}    visible    timeout=10s
    Browser.Wait For Elements State    ${filter button}    visible    timeout=10s
    Browser.Wait For Elements State    ${sorting button}    visible    timeout=10s
    Browser.Wait For Elements State    ${list of orders}    visible    timeout=10s

Verify page elements are present
    [Documentation]    Verify that all main elements are present on the page
    Browser.Get Element Count    ${title total orders}    ==    1
    Browser.Get Element Count    ${order_searchbar_input_field}    ==    1
    Browser.Get Element Count    ${filter button}    ==    1
    Browser.Get Element Count    ${sorting button}    ==    1
    Browser.Get Element Count    ${list of orders}    ==    1

Get orders
    [Documentation]    Returns array of order elements on the page
    Browser.Wait For Elements State    ${orders}    visible    timeout=10s
    @{order_elements}=    Browser.Get Elements    ${orders}
    RETURN    @{order_elements}

Verify all orders have specified fields (5)
    @{order_elements}=    order_overview_page.Get orders
    FOR    ${item}    IN    @{order_elements}
        Browser.Wait For Elements State    ${item} >> ${order item title relative}           visible    timeout=10s
        Browser.Wait For Elements State    ${item} >> ${order item company name relative}    visible    timeout=10s
        Browser.Wait For Elements State    ${item} >> ${order item shipped date relative}    visible    timeout=10s
        Browser.Wait For Elements State    ${item} >> ${order item ordered date relative}    visible    timeout=10s
        Browser.Wait For Elements State    ${item} >> ${order item status text relative}     visible    timeout=10s
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
