*** Settings ***
Documentation        All the page objects and keywords of landing page
Library        SeleniumLibrary
Library        Collections
Resource        Generic.robot

*** Variables ***
#${Shop_page_load}        css:.nav-link

*** Keywords ***
Verify items in the checkout page and proceed
    Click Element        css:..btn.btn-success