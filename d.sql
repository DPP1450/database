SELECT FLIGHT_NUMBER , LEG_NUMBER, AVAILABLE_SEATS

FROM (
    SELECT MIN(FLIGHT_NUMBER) ,LEG_NUMBER , COUNT(*) as AVAILABLE_SEATS // 加min 因為只需要第一筆
    FROM SEAT_RESERVATION
    WHERE CUSTOMER_NAME != NULL //還沒被預約的座位
    GROUP BY FLIGHT_NUMBER , LEG_NUMBER
)根據FLIGHT_NUMBER , LEG_NUMBER分組，計算出所有還沒被預約的座位
WHERE FLIGHT_NUMBER in 
(
    SELECT FLIGHT_NUMBER
    FROM LEG_INSTANCE
    WHERE COUNT(*) >= 2
    GROUP BY FLIGHT_NUMBER
) // 篩選 leg 數 >= 2 的