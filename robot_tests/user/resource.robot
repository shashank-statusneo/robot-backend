*** Settings ***
Documentation       A resource file with reusable keywords and variable

Library             RequestsLibrary


*** Variables ***
${HOST}         http://127.0.0.1
${PORT}         5000
${HEADERS}      {"Content-Type": "application/json"}


*** Keywords ***
Connect Flask App
    ${APP_SESSION}=    Create Session    APP_SESSION    ${HOST}:${PORT}    ${HEADERS}
    RETURN    ${APP_SESSION}

Send Get Request
    [Arguments]    ${session}    ${endpoint}    ${params}
    ${RESPONSE}=    GET On Session    ${session}    ${endpoint}    ${params}
    RETURN    ${RESPONSE}

Send Post Request
    [Arguments]    ${session}    ${endpoint}    ${payload}    ${expected_status}
    ${RESPONSE}=    POST On Session
    ...    ${session}
    ...    ${endpoint}
    ...    json=${payload}
    ...    expected_status=${expected_status}
    RETURN    ${RESPONSE}
