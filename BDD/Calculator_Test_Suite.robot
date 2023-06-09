*** Settings ***
Resource        Calc_keywords.resource
Library    OperatingSystem

*** Test Cases ***
#Integers 
Test Calculator With BDD Syntax
    Given The Calculator Is Running
    When The User Enters The Term "1 + 1"
    And The User Triggers The Calculation
    Then The Result Should Be "2"

#Floating/Decimals
Test computing floating numbers / decimal numbers
    Given The Calculator Is Running
    When The User Enters The Term "1.5 + 2.3"
    And The User Triggers The Calculation
    Then The Result Should Be "3.8"


#What happen if an invalid value (character) is added to the computation
Test computing multiple numerical systems
    Given The Calculator Is Running
    When The User Enters The Term "0xA+0b1"
    And The User Triggers The Calculation
    Then The Result Should Be "11"

#What happen if an invalid value (character) is added to the computation
#Test computing an invalid value
    #Given The Calculator Is Running
    #When The User Enters The Term "0xA+0xB"
    #And The User Triggers The Calculation
    #Then The Result Should Be "21"
    