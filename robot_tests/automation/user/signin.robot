*** Settings ***
Documentation       A test suite for signup

Resource            resource.robot


*** Variables ***
${email}        test123@email.com
${password}     test_password123


*** Test Cases ***
Sign In Elements Test
    Open Application
    Click Button    Sign Up
    Page Should Contain Link    Already have an account? Sign in
    Click Link    Already have an account? Sign in
    Page Should Contain Textfield    username
    Page Should Contain Textfield    password
    Page Should Contain Button    Sign In
    Page Should Contain Link    Don't have an account? Sign Up
    Page Should Contain Link    Forgot password?
    Page Should Not Contain Textfield    invalidTextfield
    Page Should Not Contain Link    Already have an account? Sign in
    [Teardown]    Close Browser

User Sign in
    Open Application
    Click Button    Sign Up
    Page Should Contain Link    Already have an account? Sign in
    Click Link    Already have an account? Sign in
    Input Text    username    ${email}
    Input Text    password    ${password}
    Click Button    Sign In
    Page Should Contain    Products
    Page Should Contain    Pricing
    Page Should Contain    Blog
    [Teardown]    Close Browser
