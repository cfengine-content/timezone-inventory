-- Author: Mike Weilgart
-- Date: 23 April 2017
-- Purpose: Show timezone for each host.
-- This query result can be accomplished easily from the Inventory UI,
-- but is shown as a custom query for illustration.

WITH tz AS (
  SELECT
    hostkey,
    variablevalue AS timezone
  FROM variables
  WHERE comp = 'default.timezone.timezone'
)
SELECT
  hostname AS "Host Name",
  ipaddress AS "IP Address",
  timezone AS "Time Zone"
FROM
  hosts
  LEFT JOIN tz USING (hostkey)
ORDER BY ipaddress::inet
;
