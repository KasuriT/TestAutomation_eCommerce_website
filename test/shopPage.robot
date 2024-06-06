*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Library        Collections
Library        ../CustomLibraries/Shop.py
Test Setup        Open the browser with payment url
Suite Setup
Resource        ../PO/landingPage.robot
Resource        ../PO/Generic.robot
Resource        ../PO/shopPage.robot
Resource        ../PO/checkoutPage.robot
Resource        ../PO/confirmationPage.robot


*** Variables ***
${browser}        chrome
@{listofProducts}        Blackberry        Nokia Edge
${country_name}        india

*** Test Cases ***

Validate UnSuccessful Login
    [Tags]        SMOKE
    landingPage.Fill the login form        ${valid_username}        ${invalid_password}
    landingPage.Wait Until Element is located in the login page
    landingPage.Verify error message is correct

Validate card display in the shopping page
    landingPage.Fill The Login Form        ${valid_username}        ${valid_password}
    shopPage.Wait Until Element is located in the login page
    shopPage.Verify card titles in the home page
    #Hello World
    Add Items To Cart And Checkout        ${listofProducts}
    checkoutPage.Verify items in the checkout page and proceed
    confirmationPage.Enter the country name and select the terms        ${country_name}
    confirmationPage.Purchase the product and confirm the purchase
    #Select The Cart        Blackberry
Select the form and navigated to child window
    landingPage.Fill the login details and select user option

*** Keywords ***
Open the browser with payment url
    Open Browser        ${url}        ${browser}


    



    








