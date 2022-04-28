SELECT f.origin, f.dest, 
round(AVG(f.distance), 0) AS avg_dist, 
round(COUNT(*)/10, 0) AS avg_flights, 
round(SUM(p.seats/10), 0) AS avg_capacity, 
round(AVG(f.arr_delay), 2) AS avg_arr_delay

FROM flights AS f
LEFT OUTER JOIN planes AS p
ON f.tailnum = p.tailnum

WHERE f.distance >= 300 AND f.distance <= 400

GROUP BY f.origin, f.dest

HAVING avg_flights >= 5000

ORDER BY avg_capacity DESC;
