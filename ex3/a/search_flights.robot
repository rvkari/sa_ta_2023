*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
The user can search for flights
    [Tags]	    search_flights
    Open browser    http://blazedemo.com/   Chrome
    Select From List By Value   xpath://select[@name='fromPort']  Paris
    Select From List by Value   xpath://select[@name='toPort']    London
    Click Button    css:input[type='submit']
    @{flights}=  Get WebElements    css:table[class='table']>tbody tr
    Should Not Be Empty     ${flights}
    Close All Browsers