*** Settings ***
Library      commands.py
#Resource    my.resource

*** Keywords ***
RPS send commands
    [Arguments]    ${command}    ${port}    ${state}
    ${output}=    Send cmds    ${command}  ${port}  ${state}
    [return]    ${output}

RPS get Power
    [Arguments]    ${command}
    ${output}=    Send cmds    ${command}
    [return]    ${output}

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