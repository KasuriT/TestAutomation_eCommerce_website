*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Test Setup        Open the browser with payment url
Resource        resource.robot


*** Variables ***
${browser}        chrome

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form
    Login to the website
    Wait until it check and display the error message
    Verify error message is correct

*** Keywords ***
Open the browser with payment url
    Open Browser        ${url}        ${browser}
    
Fill the login form
    Input Text        ${username_locator}        ${valid_username}
    Input Password        ${password_locator}        ${invalid_password}
    
Login to the website
    Click Element        ${sign_in_button}

Wait until it check and display the error message
    Wait Until Element Is Visible        ${error_message}
    
Verify error message is correct
    ${result}=        Get Text        ${error_message}
    Should Be Equal As Strings        ${result}        Incorrect username/password.



