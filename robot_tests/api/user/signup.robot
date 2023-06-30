*** Settings ***
Documentation       A test suite for signup

Resource            resource.robot
Library             Builtin
Library             Collections


*** Variables ***
&{SIGNUP_DATA}      email=shashank_test2@gmail.com    password=12345678    username=shashank_test2    role=admin


*** Test Cases ***
Sign Up
    ${APP_SESSION}=    Connect Flask App
    ${API_RESPONSE}=    Send Post Request    ${APP_SESSION}    /auth/signup    ${SIGNUP_DATA}    201
    Should Be Equal As Numbers    ${API_RESPONSE.status_code}    201
    Dictionary Should Contain Key    ${API_RESPONSE.json()}    id
