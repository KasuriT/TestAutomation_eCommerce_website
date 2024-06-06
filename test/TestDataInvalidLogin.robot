*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Library        DataDriver        file=..\\resource\\data.csv        #encoding=utf_8        dialect=unix
Test Setup        Open the browser with payment url
Resource        resource.robot
Test Template        Validate UnSuccessful Login


*** Variables ***
${browser}        chrome

*** Test Cases ***
Login with username ${username} and password ${password}
    #[Arguments]        ${username}        ${password}
    #Validate UnSuccessful Login        ${username}        ${password}

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]        ${username}        ${password}
    Open the browser with payment url
    Fill the login form        ${username}        ${password}
    Login to the website
    Wait until it check and display the error message
    Verify error message is correct
    
Open the browser with payment url
    Open Browser        ${url}        ${browser}
    
Fill the login form
    [Arguments]        ${username}        ${password}
    Input Text        ${username_locator}        ${username}
    Input Password        ${password_locator}        ${password}
    
Login to the website
    Click Element        ${sign_in_button}

Wait until it check and display the error message
    Wait Until Element Is Visible        ${error_message}
    
Verify error message is correct
    ${result}=        Get Text        ${error_message}
    Should Be Equal As Strings        ${result}        Incorrect username/password.



