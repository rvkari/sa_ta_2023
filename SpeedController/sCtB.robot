*** Settings ***
Resource     keywords.resource
#Library    Car.py    WITH NAME    volkswagen


*** Variables ***
@{SPEED_LIMIT}    30    40    50    60    80    100    120        # [0..n] -> [0..6] this list contains 7 items

${VARIABLE_1}    I am an string
${VARIABLE_n}    123

*** Test Cases ***
Test car
    volkswagen

Test passing 2 global variables
    I am just printing to the console    ${VARIABLE_1}   ${VARIABLE_n}


Test passing one string and number
    I am just printing to the console    Hello I am an string   987
