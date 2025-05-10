-- Observing the grp_member table
SELECT * FROM grp_member;

-- LetsMeet growth over the years based on number of members who joined each year
SELECT
	join_year,
    COUNT(*) AS new_members_count
FROM
	(SELECT member_id, YEAR(MIN(joined)) AS join_year
    FROM grp_member
    GROUP BY member_id) AS first_join
GROUP BY join_year
ORDER BY join_year;

-- Updating the grp_member table
SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
SET city = "Chicago"
WHERE city IN ('East Chicago', 'West Chicago', 'North Chicago', 'Chicago Heights', 'Chicago Ridge', 'Chicago');

UPDATE grp_member
SET city = 'San Francisco'
WHERE city IN ('San Francisco', 'South San Francisco');

UPDATE grp_member
SET city = 'New York'
WHERE city IN ('New York', 'West New York');

-- Checking if the update was successful
SELECT
	Distinct city
FROM
	grp_member;
    
SET SQL_SAFE_UPDATES = 1;

-- Chicago Annual Growth
SELECT
	YEAR(joined) AS join_year,
    COUNT(*) AS new_members_count
FROM
	grp_member
WHERE
	city IN ('Chicago')
GROUP BY join_year
ORDER BY join_year;

-- New York Annual Growth
SELECT
	YEAR(joined) AS join_year,
    COUNT(*) AS new_members_count
FROM
	grp_member
WHERE
	city IN ('New York')
GROUP BY join_year
ORDER BY join_year;

-- San Francisco Annual Growth
SELECT
	YEAR(joined) AS join_year,
    COUNT(*) AS new_members_count
FROM
	grp_member
WHERE
	city IN ('San Francisco')
GROUP BY join_year
ORDER BY join_year;

-- Month by month growth in 2017
SELECT
	MONTH(joined) AS join_month,
    COUNT(*) AS new_members_count
FROM
	grp_member
WHERE YEAR(joined) = 2017
GROUP BY join_month
ORDER BY join_month;