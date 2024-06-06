*** Settings ***
Documentation        All the page objects and keywords of landing page
Library        SeleniumLibrary
Library        Collections
Resource        Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link

*** Keywords ***

Wait Until Element is located in the login page
    Wait until element passed is located on page        ${Shop_page_load}

Verify card titles in the home page
    @{expectedListOfMobiles} =        Create List        iphone X        Samsung Note 8        Nokia Edge        Blackberry
    @{elements} =        Get Webelements        xpath://h4[@class='card-title']
    @{actualListOfMobiles} =        Create List
    FOR        ${mobile1}        IN        @{elements}
        Log        ${mobile1.text}
        Append To List        ${actualListOfMobiles}        ${mobile1.text}
    END
    Lists Should Be Equal        ${expectedListOfMobiles}        ${actualListOfMobiles}