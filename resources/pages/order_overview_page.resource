*** Settings ***
Library            Browser
Variables          ../locators/order_overview_page.yaml

*** Keywords ***
Wait for page elements to load
    [Documentation]    Wait for all main elements of the order overview page to be visible
    Browser.Wait For Elements State    ${title total orders}    visible    timeout=10s
    Browser.Wait For Elements State    ${order searchbar input field}    visible    timeout=10s
    Browser.Wait For Elements State    ${filter button}    visible    timeout=10s
    Browser.Wait For Elements State    ${sorting button}    visible    timeout=10s
    Browser.Wait For Elements State    ${list of orders}    visible    timeout=10s

Verify page elements are present
    [Documentation]    Verify that all main elements are present on the page
    Browser.Get Element Count    ${title total orders}    ==    1
    Browser.Get Element Count    ${order searchbar input field}    ==    1
    Browser.Get Element Count    ${filter button}    ==    1
    Browser.Get Element Count    ${sorting button}    ==    1
    Browser.Get Element Count    ${list of orders}    ==    1

Verify order list columns are visible
    [Documentation]    Verify that the order list/table shows the required columns
    Browser.Wait For Elements State    ${column header order id}        visible    timeout=10s
    Browser.Wait For Elements State    ${column header customer name}   visible    timeout=10s
    Browser.Wait For Elements State    ${column header shipped date}    visible    timeout=10s
    Browser.Wait For Elements State    ${column header order date}      visible    timeout=10s
    Browser.Wait For Elements State    ${column header status}          visible    timeout=10s

Verify first order row has required fields
    [Documentation]    Verify that the first order row contains OrderID, Customer Name, ShippedDate, OrderDate, Status
    Browser.Wait For Elements State    ${first row order id cell}       visible    timeout=10s
    Browser.Wait For Elements State    ${first row customer name cell}  visible    timeout=10s
    Browser.Wait For Elements State    ${first row shipped date cell}   visible    timeout=10s
    Browser.Wait For Elements State    ${first row order date cell}     visible    timeout=10s
    Browser.Wait For Elements State    ${first row status cell}         visible    timeout=10s