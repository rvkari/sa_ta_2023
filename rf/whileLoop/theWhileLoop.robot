*** Variables ***
${MAX_ITER}      10  

*** Keywords ***
Run keyword until MAX_ITER matches internal counter
    [Arguments]    ${i}
    ${counter}    Set Variable    0

    WHILE    ${counter} != ${i}
        #Log To Console    ${counter}
        ${counter}    Evaluate    ${counter}+1
        Log To Console    ${counter}
    END


*** Test Cases ***
Testing the while loop
    Run keyword until MAX_ITER matches internal counter    ${MAX_ITER}