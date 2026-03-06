-- Cyclistic Bike Share 2020 Analysis Queries
-- Maia Perun

-------------------------------------------------
-- 1. Ride Volume by User Type
-------------------------------------------------

SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM `cyclistic-2020-488102.cyclistic.2020_all_rides_analysis`
GROUP BY member_casual
ORDER BY total_rides DESC;
-------------------------------------------------
-- 2. Average Ride Duration
-------------------------------------------------

SELECT
  member_casual,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-2020-488102.cyclistic.2020_all_rides_analysis`
GROUP BY member_casual;
-------------------------------------------------
-- 3. Usage by Day of Week
-------------------------------------------------

SELECT
  CASE
    WHEN day_of_week IN ('1','2','3','4','5','6','7') THEN
      CASE day_of_week
        WHEN '1' THEN 'Sunday'
        WHEN '2' THEN 'Monday'
        WHEN '3' THEN 'Tuesday'
        WHEN '4' THEN 'Wednesday'
        WHEN '5' THEN 'Thursday'
        WHEN '6' THEN 'Friday'
        WHEN '7' THEN 'Saturday'
      END
    ELSE day_of_week
  END AS day_name,
  member_casual,
  COUNT(*) AS total_rides
FROM `cyclistic-2020-488102.cyclistic.2020_all_rides`
WHERE day_of_week IS NOT NULL
GROUP BY day_name, member_casual
ORDER BY day_name;
-------------------------------------------------
-- 4. Ride Length Distribution by User Type
-------------------------------------------------

WITH binned AS (
  SELECT
    member_casual,
    CASE
      WHEN ride_length_minutes BETWEEN 1 AND 10 THEN '01–10 min'
      WHEN ride_length_minutes BETWEEN 11 AND 20 THEN '11–20 min'
      WHEN ride_length_minutes BETWEEN 21 AND 30 THEN '21–30 min'
      WHEN ride_length_minutes BETWEEN 31 AND 45 THEN '31–45 min'
      WHEN ride_length_minutes BETWEEN 46 AND 60 THEN '46–60 min'
      WHEN ride_length_minutes > 60 THEN '60+ min'
      ELSE 'Other/Invalid'
    END AS ride_length_bin
  FROM `cyclistic-2020-488102.cyclistic.2020_all_rides_analysis`
)
SELECT
  member_casual,
  ride_length_bin,
  COUNT(*) AS rides,
  ROUND(
    100 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY member_casual),
    2
  ) AS pct_within_user_type
FROM binned
WHERE ride_length_bin != 'Other/Invalid'
GROUP BY member_casual, ride_length_bin
ORDER BY
  member_casual,
  CASE ride_length_bin
    WHEN '01–10 min' THEN 1
    WHEN '11–20 min' THEN 2
    WHEN '21–30 min' THEN 3
    WHEN '31–45 min' THEN 4
    WHEN '46–60 min' THEN 5
    WHEN '60+ min' THEN 6
    ELSE 7
  END;

-------------------------------------------------
-- 5. Median Ride Length by User Type
-------------------------------------------------

SELECT
  member_casual,
  APPROX_QUANTILES(ride_length_minutes, 100)[OFFSET(50)] AS median_ride_length_minutes
FROM `cyclistic-2020-488102.cyclistic.2020_all_rides_analysis`
GROUP BY member_casual;
