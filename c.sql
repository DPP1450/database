SELECT DISTINCT FLIGHT_NUMBER , MIN(DEPARTURE_TIME) as DPT , MAX(ARRIVAL_TIME) as ART
FROM FLIGHT_LEG
GROUP BY FLIGHT_NUMBER


