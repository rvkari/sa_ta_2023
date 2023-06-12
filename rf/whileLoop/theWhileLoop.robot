*** Variables ***
${MAX_ITER}      10 

#When declaring variables in this section you dont need to implement/type the builtin keyword/function provided by RF but you can assign its value right after pressing tap
${HI}           Hello World!

*** Keywords ***
Run keyword until MAX_ITER matches internal counter
    [Arguments]    ${i}
    ${counter}=    Set Variable    0

    ### Setting local variables requires the usage of the builtin keyword/fnc named "Set Variable" if you dont une it, the variable will remain empty and your test will fail
    ${hi2_spanish}=     Set Variable            Hola mundo!
    ${var1}	${var2}=    Set Variable            Hello   12345

    Log To Console    ${HI}
    Log To Console    ${hi2_spanish}
    Log To Console    ${var1}
    Log To Console    ${var2}

    WHILE    ${counter} != ${i}
        #Log To Console    ${counter}
        ${counter}    Evaluate    ${counter}+1
        Log To Console    ${counter}
    END


*** Test Cases ***
Testing the while loop
    [Tags]    Smoke test
    Run keyword until MAX_ITER matches internal counter    ${MAX_ITER}