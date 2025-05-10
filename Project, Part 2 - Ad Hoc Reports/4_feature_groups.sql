-- Ovserving grp table
SELECT * FROM grp;

-- Breakdown of ratings
SELECT
	CASE
		WHEN rating = 0 THEN 'No Ratings'
        WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
        WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
        WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
        WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
        WHEN rating = 5 THEN '5'
	END AS rating_range,
    COUNT(*) AS group_count
FROM
	grp
GROUP BY rating_range
ORDER BY rating_range;

-- Group with 5 star rating and most members
SELECT
	group_name,
    members
FROM grp
WHERE rating = 5
GROUP BY group_name
ORDER BY members DESC;

-- Groups from New York, Chicago, and San Francisco
SELECT
	g.group_name,
    c.city,
    g.members,
    cat.category_name
FROM grp g
JOIN city c ON g.city_id = c.city_id
JOIN category cat ON g.category_id = cat.category_id
WHERE g.rating = 5
AND c.city IN ('New York', 'San Francisco', 'Chicago')
GROUP BY g.group_name, c.city
ORDER BY
	members DESC;
