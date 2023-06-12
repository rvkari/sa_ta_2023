*** Settings ***
Library      commands.py
#Resource    my.resource

*** Variables ***
@{LIST_CITIES}        Helsinki    Tampere    Vantaa

*** Keywords ***
RPS send commands
    [Arguments]    ${command}    ${port}    ${state}
    ${output}=    Send cmds    ${command}  ${port}  ${state}
    [return]    ${output}

RPS get Power
    [Arguments]    ${command}
    ${output}=    Send cmds    ${command}
    [return]    ${output}

### Optimized test case  for testing the RPS on 3 Cities
RF functionality
    @{districts}    Create List    Hel-Töölo    Hel-Pasila    Hel-Kamppi   Hel-Pasila    Hel-Kamppi   

    ${l_cities}         Get Length    ${LIST_CITIES} 
    ${l_districts}      Get Length    ${districts} 

    Log To Console    ${l_cities}
    Log To Console    ${l_districts}

for loop for printing the Cities and districts
    #Cities
    FOR    ${element}    IN    @{LIST}
        Log To Console    ${element}
        
    END

    #Districts
    FOR    ${element}    IN    @{LIST}
        Log To Console    ${element}
        
    END

while loop for printing the Cities and districts
    WHILE    $var_in_py_expr1 == $var_in_py_expr2
        
    END

*** Test Cases ***
Turn on Power supply Helsinki remotely
     ${out}=    RPS send commands     SetPower  Helsinki  1
     Should be equal    ${out}  ${True}

Verify power supply Helsinki is on
    ${out}=     RPS get power    GetPower
    should contain    ${out}  Helsinki=1

Turn off Power supply Espoo remotely
     ${out}=    RPS send commands     SetPower  Espoo  0
     Should be equal    ${out}  ${True}

Verify power supply Espoo is off
    ${out}=     RPS get power    GetPower
    should contain    ${out}  Espoo=0


### Optimized test case  for testing the RPS on 3 Cities
Testing the functionality of rf
    RF functionality