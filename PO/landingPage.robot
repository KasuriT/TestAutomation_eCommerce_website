*** Settings ***
Documentation        All the page objects and keywords of landing page
Library        SeleniumLibrary
Resource        Generic.robot

*** Variables ***
${error_message}        css:.alert-danger

*** Keywords ***
Fill the login form
    [Arguments]        ${username}        ${password}
    Input Text        id:username        ${username}
    Input Password        id:password        ${password}
    Click Button        ${sign_in_button}

Wait Until Element is located in the login page
    Wait until element passed is located on page        ${error_message}

Verify error message is correct
    ${result}=        Get Text        ${error_message}
    Should Be Equal As Strings        ${result}        Incorrect username/password.
    Element Text Should Be        ${error_message}        Incorrect username/password.

Fill the login details and select user option

    Input Text        ${username_locator}        ${valid_username}
    Input Password        ${password_locator}        ${valid_password}
    Click Element        ${user_radioButton}
    Wait Until Element Is Visible        css:.modal-body
    Click Button        ${okay_button}
    Click Button        ${okay_button}
    Select From List By Value        ${dropdown_teach}        teach
    Wait Until Element Is Visible        ${select_terms}
    Select Checkbox        ${select_terms}
    Checkbox Should Be Selected        ${select_terms}