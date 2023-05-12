# Speed controller of autonomous vehicles

Basically every road has an speed limit wich changes regularely. The aim of an autonomous speed controller is to adjust speeds to the current limit with a certain offset.

## Behavior-driven development [BDD] approach  
As a        driver
I WANT      the car to determine the speed limit and adjust the speed to that limit.
SO THAT     I don't have to adjust the speed myself

## Acceptance test-driven development [ATDD] approach 
GIVEN       the speed limit 70km/h
WHEN        the car in moving
THEN        the speed limit should remain/adjusted between 65 and 70km/h

GIVEN       the speed limit 70km/h
WHEN        the speed limit changes to 50km/h
THEN        deceleration rate should be 15km/h