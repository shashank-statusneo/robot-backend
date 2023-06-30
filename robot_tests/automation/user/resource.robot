*** Settings ***
Documentation       A resource file with reusable keywords and variable

Library             RequestsLibrary
Library             SeleniumLibrary


*** Variables ***
${HOST}                 http://127.0.0.1
${PORT}                 3000
${BROWSER}              chrome
${VALID_USERNAME}       test
${VALID_PASSWORD}       test_password


*** Keywords ***
Open Application
    Open Browser    ${HOST}:${PORT}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
