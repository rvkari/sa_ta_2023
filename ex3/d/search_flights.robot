*** Settings ***
Resource        ../c/search_flights_keywords.robot


*** Test Cases ***
The user can search for flights
    Select Departure City   Paris
    Select Destination City    London
    Search For Flights
    There are available Flights