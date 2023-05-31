*** Settings ***
Library     RequestsLibrary
# Library    OperatingSystem


*** Variables ***
${BASE_URL}     http://127.0.0.1:5000
# ${demand_forecast_file}
# ...    Get file
# ...    C:\Users\ShashankAgarwal\OneDrive - StatusNeo\Desktop\Code\inventory-optimizer\demand_forecast_data.csv
# ${headers}    {"Content-Type": "multipart/form-data"}


*** Test Cases ***
Quick Google Get Response Test
    ${response}=    GET    https://www.google.com
    Log To Console    ${response}
    Should Be Equal As Strings    ${response.status_code}    200

Flask App Ping Response Test
    Create Session    FLASK_SESSION    ${BASE_URL}

Get Mock Api Result
    Create Session    FLASK_SESSION    ${BASE_URL}
    ${API_RESPONSE}=    POST On Session    FLASK_SESSION    /mock/algorithm
    Log To Console    ${API_RESPONSE}
    Should Be Equal As Strings    ${API_RESPONSE.status_code}    200

# Create a new Demand Forecast Upload
#    Create Session    FLASK_SESSION    ${BASE_URL}
#    ${UPLOAD_DEMAND_FORECAST_RESPONSE}=    POST On Session
#    ...    FLASK_SESSION
#    ...    /demand_forecast
#    ...    "file": ${demand_forecast_file}
#    Log To Console    ${UPLOAD_DEMAND_FORECAST_RESPONSE}
