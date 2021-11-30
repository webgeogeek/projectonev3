/******EXPLORE DATA******/

SELECT 
    *
FROM
    projectone.`202108-sampsizev0`;



/********TOTAL NUMBER OF ROWS********/


SELECT 
    COUNT(*) AS id
FROM
    `202108-sampsizev0`;



/******LOOK FOR DISTINCT VALUE IN THE DATA*****/


SELECT 
    DISTINCT member_casual
FROM
    `202108-sampsizev0`;




/***MAX RIDE LENGTH ***/


SELECT MAX(ride_length)
FROM `202108-sampsizev0`;




/***MINIMUM RIDE LENGTH***/


SELECT MIN(ride_length)
FROM `202108-sampsizev0`;




/***MEAN VALUE OF RIDE LENGTH***/


SELECT AVG(ride_length)
FROM `202108-sampsizev0`;



/***THE MEAN VALUE CAME OUT DIFFFERENT FROM THE ONE IN SPREADSHEET***/
/***WILL BE CONVERTING THE DECIMAL VALUE OF MEAN RIDE LENGTH 
TO A HH:MM:SS DATETIME DATATYPE***/
/***THE MEAN DECIMAL VALUE IS FROM THE SPREADSHEET***/

       
SELECT SEC_TO_TIME(86400 * 0.0185);





/***MEAN RIDE LENGTH OF CASUAL AND MEMBER RIDERS***/

SELECT AVG(ride_length)
FROM `202108-sampsizev0`
WHERE member_casual = 'casual';



SELECT AVG(ride_length)
FROM `202108-sampsizev0`
WHERE member_casual = 'member';




/***FINDING THE NUMBER OF CASUAL RIDERS IN EACH DAY***/


SELECT day_of_week, COUNT(member_casual)
FROM `202108-sampsizev0`
WHERE member_casual='casual'
GROUP BY day_of_week
ORDER BY COUNT(member_casual)
DESC;





/***FINDING THE NUMBER OF MEMBER RIDERS IN EACH DAY***/


SELECT day_of_week, COUNT(member_casual)
FROM `202108-sampsizev0`
WHERE member_casual='member'
GROUP BY day_of_week
ORDER BY COUNT(member_casual)
DESC;




/***LOOKING FOR THE TYPE OF BICYCLES (ELECTRIC OR CLASSIC BIKE) IN THE DATA***/

SELECT 
    DISTINCT rideable_type
FROM
    projectone.`202108-sampsizev0`;




/***HOW MANY MEMBER RIDERS RIDE ELECTRIC OR CLASSIC BIKE***/


SELECT
	rideable_type, COUNT(member_casual)
FROM
	`202108-sampsizev0`
WHERE
	member_casual = 'member'
GROUP BY
	rideable_type
ORDER BY
	COUNT(member_casual)
DESC;





/***HOW MANY CASUAL RIDERS RIDE ELECTRIC OR CLASSIS BIKE***/


SELECT
	rideable_type, COUNT(member_casual)
FROM
	`202108-sampsizev0`
WHERE
	member_casual = 'casual'
GROUP BY
	rideable_type
ORDER BY
	COUNT(member_casual)
DESC;





/******NUMBER OF CASUAL RIDERS ON ELECTRIC BIKES PER DAY OF WEEK*****/



SELECT
	day_of_week, COUNT(rideable_type)
FROM
	`202108-sampsizev0`
WHERE
    rideable_type = 'electric_bike' AND member_casual = 'casual'
GROUP BY
	day_of_week
ORDER BY
	day_of_week
ASC;
