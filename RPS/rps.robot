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

my for loop for cities        # TODO: you can inplement the for loop for changing the state in here and then call ít from the main keyword or any test it might be useful 
    [Arguments]    ${state}
    FOR    ${city}    IN    @{LIST_CITIES}
        Log    ${city}
        
    END

while loop for printing the Cities and districts

    # Create a local list containing districs of a city
    ${counter}=    Set Variable    0

    ${l_cities}         Get Length    ${LIST_CITIES}      #[0..2] -> Get Length as 3 items existing in the list  

    WHILE    ${counter} < ${l_cities}     #[0..2] by typing <=3 the loop will actuallt iterate 4x not 3x

        Log To Console    ${LIST_CITIES}[${counter}]
        ${counter}    Evaluate    ${counter}+1
        
        
    END

Set power on and off
    [Arguments]    ${state}    # on=1 and off=0
    #Log To Console    ${state}

    IF    ${state} == 1
        FOR    ${city}    IN    @{LIST_CITIES}
            #Log To Console    ${city}
            
            ${out}=    RPS send commands     SetPower   ${city}      1
            Should be equal    ${out}  ${True} 

            
            Log To Console    Verifying power on given cities is on

            ${out}=     RPS get Power    GetPower
            should contain    ${out}  ${city}=1
        END      
    
    ELSE IF    ${state} == 0
        FOR    ${city}    IN    @{LIST_CITIES}
            #Log To Console    ${city}
            
            ${out}=    RPS send commands     SetPower   ${city}      0
            Should be equal    ${out}  ${True} 

            Log To Console    Verifying power on given cities is off

            ${out}=     RPS get Power    GetPower
            should contain    ${out}  ${city}=0
        END 
    ELSE 
        Log To Console    You have intruduce an invalid state
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

Test to power on the listed cities to be on and off
    Log To Console    Power to be switched on in all cities
    Set power on and off    1

    Log To Console    Power to be switched off in all cities
    Set power on and off    0
    
    