SELECT * FROM event;

SELECT
	event_name
FROM event
WHERE LOWER(event_name) LIKE '%toastmaster%';

SELECT
	event_name,
    c.city
FROM event e
JOIN grp g ON e.group_id = g.group_id
JOIN city c ON g.city_id = c.city_id
WHERE LOWER(event_name) LIKE '%toastmaster%';

SELECT
    c.city,
    COUNT(*)
FROM event e
JOIN grp g ON e.group_id = g.group_id
JOIN city c ON g.city_id = c.city_id
WHERE LOWER(event_name) LIKE '%toastmaster%'
GROUP BY city;