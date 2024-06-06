*** Settings ***
Documentation        All the page objects and keywords of landing page
Library        SeleniumLibrary
Library        Collections
Resource        Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link
${country_location}        //a[text()='India']

*** Keywords ***
Enter the country name and select the terms
    [Arguments]        ${country_name}
    Input Text        id:country        ${country_name}
    Wait until element passed is located on page        //a[text()='${country_name}']
    Click Element        //a[text()='${country_name}']
    Sleep        2
    Click Element        css:.checkbox label

Purchase the product and confirm the purchase
    Click Button        css:.btn-success
    Page Should Contain        Success!