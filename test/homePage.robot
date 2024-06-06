*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Library        Collections
Test Setup        Open the browser with payment url
Resource        ../PO/Generic.robot


*** Variables ***
${browser}        chrome

*** Test Cases ***
#Validate UnSuccessful Login
    #Fill the login form        ${valid_username}        ${invalid_password}
    #Wait Until Element is located in the login page        ${error_message}
    #Verify error message is correct

Validate card display in the shopping page
    Fill The Login Form        ${valid_username}        ${valid_password}
    Wait Until Element is located in the home page        ${checkout}
    Verify card titles in the home page
    Select The Cart        Blackberry

*** Keywords ***
Open the browser with payment url
    Open Browser        ${url}        ${browser}
    
Fill the login form
    [Arguments]        ${username}        ${password}
    Input Text        ${username_locator}        ${valid_username}
    Input Password        ${password_locator}        ${valid_password}
    Click Element        ${sign_in_button}

#Wait Until Element is located in the login page
    #[Arguments]        ${element}
    #Wait Until Element Is Visible        ${error_message}
    
#Verify error message is correct
    #${result}=        Get Text        ${error_message}
    #Should Be Equal As Strings        ${result}        Incorrect username/password.
    #Element Text Should Be        ${error_message}        Incorrect username/password.

Wait Until Element is located in the home page
    [Arguments]        ${element}
    Wait Until Element Is Visible        ${element}        timeout=10s

Verify card titles in the home page
    @{expectedListOfMobiles}        Create List        iphone X        Samsung Note 8        Nokia Edge        Blackberry
    @{elements}        Get Webelements        xpath://h4[@class='card-title']
    @{actualListOfMobiles}        Create List
    FOR        ${mobile1}        IN        @{elements}
        Log        ${mobile1.text}
        Append To List        ${actualListOfMobiles}        ${mobile1.text}
    END
    Lists Should Be Equal        ${expectedListOfMobiles}        ${actualListOfMobiles}

Select The Cart
    [Arguments]        ${cartName}
    ${elements}=        Get Webelements        css:.card-title
    ${index}=        Set Variable        1
    FOR        ${mobile1}        IN        @{elements}
        Exit For Loop If    '${cartName}'        ==        '${mobile1.text}'
        ${index}=        Evaluate        ${index} + 1
    END
    Click Button        xpath:(//*[@class='card-footer'])[${index}]/button


