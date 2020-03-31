SELECT avg("MeasuredPressur") as Pr, start_date, end_date,  duration
FROM sensorydata_thermozuluwindow
GROUP BY start_date, duration, end_date
ORDER BY start_date


SELECT avg("MeasuredExternalTemperature") as TempOutdoor, start_date, end_date,  duration
FROM sensorydata_thermozuluwindow
GROUP BY start_date, duration, end_date
ORDER BY start_date

SELECT timezone('ZULU'::text, last_connection::timestamp without time zone) AS timep, hvac_state
FROM thermostat
WHERE label='AC-12' and timezone('ZULU'::text, last_connection::timestamp without time zone)::DATE >= '2019-05-01'
ORDER BY timezone('ZULU'::text, last_connection::timestamp without time zone)

SELECT "Date", AVG(pressure)
FROM(
SELECT "Date", avg("MeasuredPressur") as Pressure, start_date, end_date,  duration
FROM sensorydata_thermozuluwindow
GROUP BY start_date, duration, end_date, "Date"
ORDER BY start_date, "Date") AS TB1
GROUP BY "Date"
ORDER BY "Date"


SELECT "Date", avg("pr"), sum("duration")
FROM(
SELECT "Date", avg("MeasuredPressur") as Pr, start_date, end_date,  duration
FROM sensorydata_thermozuluwindow
GROUP BY start_date, duration, end_date, "Date"
ORDER BY start_date, "Date"
	) as foo
	GROUP BY "Date"
	
	
	SELECT "Date", avg("MeasuredExternalTemperature") as TempOutdoor, start_date, end_date,  duration
FROM sensorydata_thermozuluwindow
GROUP BY start_date, end_date, "Date"
ORDER BY start_date, "Date"

sensory."MeasuredPressur" < 80::double precision AND


SELECT "Date", "Time"::TIME AS "Time", "date_time", "MeasuredPressur", "MeasuredEvapTemperature", "MeasuredExternalTemperature", "CalculatedSuperheat"
FROM sensory 
WHERE "Date" >= '2019-05-01' AND file_name ~ 'Unit_002_Circuit 2'
ORDER BY "Date", "Time"
LIMIT 100

SELECT "Date", "Time"::TIME AS "Time", "date_time", "MeasuredPressur" AS "inletP",
"MeasuredEvapTemperature" AS "SuctionT", "MeasuredExternalTemperature"::double precision AS "LiquidL", "CalculatedSuperheat"
FROM sensory 
WHERE "Date" >= '2019-05-01' AND file_name ~ 'Unit_002_Circuit 2' AND "MeasuredExternalTemperature" <> '-'::text
ORDER BY "Date", "Time" ASC 

CREATE VIEW Dec4 AS
SELECT "Date", "Time"::TIME AS "Time", "date_time", "MeasuredPressur" AS "outletP", "MeasuredEvapTemperature" AS "DischargeT", "MeasuredExternalTemperature"::double precision AS "Outdoor", 
"CalculatedSuperheat" AS "SH4" 
FROM sensory 
WHERE "Date" >='2018-12-01' AND "Date" <= '2018-12-31' AND file_name ~ 'Unit_004_Circuit 2' AND "MeasuredExternalTemperature" <> '-'::text
ORDER BY "Date", "Time" ASC 
