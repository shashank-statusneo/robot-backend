*** Settings ***
Documentation       A test suite for sigin

Resource            resource.robot
Library             Builtin
Library             Collections
Library             RequestsLibrary


*** Variables ***
&{VALID_SIGNIN_DATA}        username=shashank    password=12345678
&{INVALID_SIGNIN_DATA}      username=shashank    password=invalid_password


*** Test Cases ***
Valid Sign In
    ${APP_SESSION}=    Connect Flask App
    ${API_RESPONSE}=    Send Post Request    ${APP_SESSION}    /auth/login    ${VALID_SIGNIN_DATA}    200
    Should Be Equal As Numbers    ${API_RESPONSE.status_code}    200
    Dictionary Should Contain Key    ${API_RESPONSE.json()}    access_token
    Dictionary Should Contain Key    ${API_RESPONSE.json()}    refresh_token
    Dictionary Should Not Contain Key    ${API_RESPONSE.json()}    invalid_key

Invalid Sign In
    ${APP_SESSION}=    Connect Flask App
    ${API_RESPONSE}=    Send Post Request    ${APP_SESSION}    /auth/login    ${INVALID_SIGNIN_DATA}    403
    Log To Console    ${API_RESPONSE.status_code}
    Should Be Equal As Numbers    ${API_RESPONSE.status_code}    403
    Dictionary Should Contain Key    ${API_RESPONSE.json()}    error
