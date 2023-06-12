*** Settings ***
Library      commands.py
Library    Collections
#Resource    my.resource

*** Variables ***
@{LIST_CITIES}      Helsinki        Tampere         Vantaa

@{LIST_HEL_DIS}     Hel-Töölo       Hel-Pasila      Hel-Kamppi
@{LIST_TRE_DIS}     Tre-A            Tre-B

${CITIES_DIST}    

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

    #Log To Console    ${l_cities}
    #Log To Console    ${l_districts}

    [Return]    @{districts}

    #Return From Keyword    @{districts}

rf dicops

    ${local_dic}=    Create Dictionary

    FOR    ${city}    IN    @{LIST_CITIES}
        IF    "${city}" == "Helsinki"
            Set To Dictionary    ${local_dic}    ${city}    ${LIST_HEL_DIS}
        
        ELSE IF    "${city}" == "Tampere"
            Set To Dictionary    ${local_dic}    ${city}    ${LIST_TRE_DIS}
        
        ELSE
            Set To Dictionary    ${local_dic}    ${city}    None
        END
    END
    

    #Log To Console    ${local_dic}
    #Log To Console    ${CITIES_DIST}

    Set Global Variable   ${CITIES_DIST}     ${local_dic}    # USE keyword/fnc || Set Global Variable ||    <${YOUR_GLOBAL}>    <${YOUR LOCAL}> 
    Log To Console    ${CITIES_DIST}


for loop for printing the Cities and districts
    # Create a local list containing districs of a city
    @{a_list}   RF functionality
    #Cities and their districts
    FOR    ${city}    IN    @{LIST_CITIES}
        IF    "${city}" == "Helsinki"
            FOR    ${district}    IN    @{a_list}
                Log To Console    ${district}
            END
            
        END

        Log To Console    ${city}
        
    END

    #Districts
    #FOR    ${district}    IN    @{a_list}
        #Log To Console    ${district}
        
    #END

while loop for printing the Cities and districts

    # Create a local list containing districs of a city
    ${counter}=    Set Variable    0

    ${l_cities}         Get Length    ${LIST_CITIES}      #[0..2] -> Get Length as 3 items existing in the list  

    WHILE    ${counter} < ${l_cities}     #[0..2] by typing <=3 the loop will actuallt iterate 4x not 3x

        Log To Console    ${LIST_CITIES}[${counter}]
        ${counter}    Evaluate    ${counter}+1
        
        
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

Testing loops
    #for loop for printing the Cities and districts
    #while loop for printing the Cities and districts
    rf dicops
    