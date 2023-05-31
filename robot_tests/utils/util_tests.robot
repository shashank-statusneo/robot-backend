*** Settings ***
Library     C:\\Users\\mishs\\OneDrive\\Desktop\\Shashank Agarwal\\inventory-optimizer-backend\\main\\utils.py


*** Test Cases ***
Test Get SUM
    ${sum_response}=    csv_to_dict    ${csv_file}
    Should Be Equal    ${sum_response}    ${9}
