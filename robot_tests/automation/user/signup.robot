*** Settings ***
Documentation       A test suite for signup

Resource            resource.robot


*** Variables ***
${first_name}       test
${last_name}        user
${username}         test_username
${email}            test123@email.com
${password}         test_password123


*** Test Cases ***
Sign Up Elements Test
    Open Application
    Click Button    Sign Up
    Page Should Contain Textfield    firstName
    Page Should Contain Textfield    lastName
    Page Should Contain Textfield    username
    Page Should Contain Textfield    email
    Page Should Contain Textfield    password
    Page Should Contain Button    Sign Up
    Page Should Contain Link    Already have an account? Sign in
    Page Should Not Contain Textfield    invalidTextfield
    Page Should Not Contain Button    Sign In
    Page Should Not Contain Link    Forgot Password
    [Teardown]    Close Browser

User Sign Up
    Open Application
    Click Button    Sign Up
    Input Text    username    ${username}
    Input Text    email    ${email}
    Input Text    password    ${password}
    Click Button    Sign Up
    [Teardown]    Close Browser
