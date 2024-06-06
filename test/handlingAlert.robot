*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Library        Collections
Test Setup        Open the browser with payment url
Resource        ../PO/Generic.robot


*** Variables ***
${browser}        chrome

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form        ${valid_username}        ${invalid_password}
    Wait Until Element is located in the login page        ${error_message}
    Verify error message is correct
    Fill the login details and select user option


*** Keywords ***
Open the browser with payment url
    Open Browser        ${url}        ${browser}
    
Fill the login form
    [Arguments]        ${username}        ${password}
    Input Text        ${username_locator}        ${valid_username}
    Input Password        ${password_locator}        ${valid_password}
    Click Element        ${sign_in_button}

Wait Until Element is located in the login page
    [Arguments]        ${element}
    Wait Until Element Is Visible        ${error_message}
    
Verify error message is correct
    ${result}=        Get Text        ${error_message}
    Should Be Equal As Strings        ${result}        Incorrect username/password.
    Element Text Should Be        ${error_message}        Incorrect username/password.

Fill the login details and select user option
    Input Text        ${username_locator}        ${valid_username}
    Input Password        ${password_locator}        ${valid_password}
    Click Element        ${user_radioButton}
    Wait Until Element Is Visible        css:.modal-body
    Click Element        ${okay_button}
    Select From List By Value        ${dropdown_teach}        teach
    Wait Until Element Is Visible        ${select_terms}
    Select Checkbox        ${select_terms}
    Checkbox Should Be Selected        ${select_terms}
    

