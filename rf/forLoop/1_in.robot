*** Variables ***
@{mammals}    cat    dog    cow
@{birds}    eagle    falcon    ladybird

${user1}    peter
${user2}    bruce
${user3}    tony


*** Test Cases ***
Loop over list
    Log To Console    3 mammals:
    FOR   ${var}    IN    @{mammals}
        Log To Console    ${var}
    END

Loop over two lists after each other
    Log To Console    3 mammals & three birds:
    FOR   ${var}    IN    @{mammals}    @{birds}
        Log To Console    ${var}
    END

Loop over multiple values
    Log To Console    3 users:
    FOR   ${var}    IN    ${user1}    ${user2}    ${user3}    Steve
        Log To Console    ${var}
    END