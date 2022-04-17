SELECT FL.LEG_NUMBER , SR.AVAILABLE_SEATS
FROM (
    SELECT FLIGHT_NUMBER , LEG_NUMBER , AVAILABLE_SEATS , COUNT(*) as LEG_COUNT
    FROM FLIGHT_LEG
    GROUP BY FLIGHT_NUMBER
) as FL
    JOIN (
    SELECT FLIGHT_NUMBER , LEG_NUMBER, COUNT(*) as AVAILABLE_SEATS
    FROM SEAT_RESERVATION 
) as SR
    ON FL.FLIGHT_NUMBER = SR.FLIGHT_NUMBER AND FL.LEG_NUMBER = SR.LEG_NUMBER
WHERE FL.LEG_COUNT >= 1
