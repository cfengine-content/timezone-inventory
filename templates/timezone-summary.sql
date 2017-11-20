-- Author: Mike Weilgart
-- Date: 23 April 2017
-- Purpose: Show host count by timezone.

WITH tz AS (
  SELECT
    hostkey,
    variablevalue AS timezone
  FROM variables
  WHERE comp = 'default.timezone.timezone'
)
SELECT
  count(hostkey) AS "Host Count",
  timezone AS "Time Zone"
FROM tz
GROUP BY timezone
ORDER BY timezone
;
