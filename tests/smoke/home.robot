*** Settings ***
Documentation       Simple smoke test for home page

Resource            ../../resources/browser.resource
Resource            ../../resources/pages/home_page.resource

Suite Setup         Open Browser To Base URL
Suite Teardown      Close Browser

Test Tags           smoke


*** Test Cases ***
Home Page Loads And Shows Title
    [Documentation]    Given/When/Then-Stil im Kleinen
    Given Home Page Should Be Visible
    When Click Get Started
    Then Page Should Contain    Getting Started
