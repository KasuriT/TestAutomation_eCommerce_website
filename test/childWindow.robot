*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Library        String
Library        Collections
Test Setup        Open the browser with payment url
Resource        ../PO/Generic.robot


*** Variables ***
${browser}        chrome
${email}

*** Test Cases ***
Validate Child Window Functionality
    Select the link of child window
    Verify user is switch to child window
    Grab the email id in child window
    Switch to the parent window and enter the email id

*** Keywords ***
Open the browser with payment url
    Open Browser        ${url}        ${browser}
Select the link of child window
    Click Element        ${child_window}
    Sleep        5
      
Verify user is switch to child window
    Switch Window        NEW
    Element Text Should Be        css:h1        DOCUMENTS REQUEST    

Grab the email id in child window
    ${text}        Get Text        css:.red
    @{words}=        Split String        ${text}        at
    ${text_split}=        Get From List        ${words}        1
    Log        ${text_split}
    @{words2}=        Split String        ${text_split}        @
    ${email}=        Get From List        ${words2}        1
    Set Global Variable        ${email}

Switch to the parent window and enter the email id
    Switch Window        MAIN
    Title Should Be        LoginPage Practise | Rahul Shetty Academy
    Input Text        ${username_locator}        ${email}






    

