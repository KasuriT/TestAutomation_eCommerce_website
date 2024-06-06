*** Settings ***
Documentation    A resource file with reusable keywords and variables
...
...        The system specific keywords created here form our own
...        domain specific language. They utilize keywords provided
...        by the imported SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${url}        https://rahulshettyacademy.com/loginpagePractise/
${valid_username}        rahulshettyacademy
${invalid_password}        123456
${valid_password}        learning
${actual_title}        LoginPage Practise | Rahul Shetty Academy

#locators
${username_locator}        id:username
${password_locator}        id:password
${sign_in_button}        id:signInBtn

#${checkout}        css:.nav-link.btn.btn-primary
${user_radioButton}        css:input[value='user']
${dropdown_teach}        css:select.form-control
${okay_button}        id:okayBtn
${select_terms}        id:terms
${child_window}        css:.blinkingText

*** Keywords ***
Open the browser with payment url
    Create Webdriver    Chrome executable_path= C:/Users/lenovo/PycharmProjects/eCommerceWebAutomation/test/resources/chromedriver.exe
    Go To   ${url}

Wait until element passed is located on page
    [Arguments]        ${page_locator}
    Wait Until Element Is Visible        ${page_locator}        timeout=20s
