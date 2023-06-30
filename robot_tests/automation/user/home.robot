*** Settings ***
Documentation       A test suite for homepage

Resource            resource.robot


*** Test Cases ***
Valid App Name
    Open Application
    Page Should Contain    ROBOT EXAMPLE
    [Teardown]    Close Browser

Valid Sign Up Button
    Open Application
    Page Should Contain Button    Sign Up
    [Teardown]    Close Browser

Invalid Valid App Name
    Open Application
    Page Should Not Contain    Invalid App Name
    [Teardown]    Close Browser

Invalid Sign Up Button
    Open Application
    Page Should Not Contain Button    Sign In
    [Teardown]    Close Browser

Home Group Test
    Open Application
    Page Should Contain    ROBOT EXAMPLE
    Page Should Contain Button    Sign Up
    Page Should Not Contain    Invalid App Name
    Page Should Not Contain Button    Sign In
    [Teardown]    Close Browser
