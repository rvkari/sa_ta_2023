*** Settings ***
Library    Car.py    WITH NAME    volkswagen

*** Variables ***
@{SPEED_LIMIT}    30    40    50    60    80    100    120        # [0..n] -> [0..6] this list contains 7 items

*** Keywords ***
Set Speed Limit
    [Arguments]    ${limit}
    Set Speed Limit    ${limit}
    Log     Setting speed limit to ${limit} km/h.

Car Is Moving
    Log    the car is moving

Speed Is Within Limit
    [Arguments]    ${lower_limit}    ${upper_limit}
    Log    Checking if current speed is within the limit (${lower_limit} to ${upper_limit} km/h).

Decelerate Car
    Log     Decelerating car

Speed Decreased By
    [Arguments]    ${decrease_rate}
    Log    Checking if speed has decreased by ${decrease_rate} km/h.


volkswagen
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


I am just printing to the console
    [Arguments]    ${var1}    ${var2}
    Log    ${var1}
    Log    ${var2}

    Log To Console    ${var1} ${var2}    


