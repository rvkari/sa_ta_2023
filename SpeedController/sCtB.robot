*** Settings ***
#Library    keywords.robot
Library    Car.py    WITH NAME    volkswagen


*** Variables ***
@{SPEED_LIMIT}    30    40    50    60    80    100    120        # [0..n] -> [0..6] this list contains 7 items

${VARIABLE_1}    I am an string
${VARIABLE_n}    123

*** Keywords ***
I am just printing to the console
    [Arguments]    ${var1}    ${var2}
    Log    ${var1}
    Log    ${var2}

    Log To Console    ${var1} ${var2}   

*** Test Cases ***
Create an object
    [Documentation]    This calls the python app directly

    #FOR    ${element}    IN    @{SPEED_LIMIT}
        #Log To Console    ${element}
        
    #END

    FOR    ${current_speed_limit}    IN    @{SPEED_LIMIT}
        Log    ${current_speed_limit}

        volkswagen.Set Speed Limit    ${current_speed_limit}
        volkswagen.Car Is Moving
        volkswagen.Speed Is Within Limit
        volkswagen.Reset Speed

        Log To Console    ${current_speed_limit}
        
    END

Test passing 2 global variables
    I am just printing to the console    ${VARIABLE_1}   ${VARIABLE_n}


Test passing one string and number
    I am just printing to the console    Hello I am an string   987
