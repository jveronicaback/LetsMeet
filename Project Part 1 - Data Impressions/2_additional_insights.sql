-- venue_
-- analyzing pattern at the country level
SELECT
	country,
    COUNT(*) venue_count
FROM
	venue_
GROUP BY country
ORDER BY venue_count DESC;
-- analyzing pattern at the state level
SELECT
	state,
    COUNT(*) venue_count
FROM
	venue_
GROUP BY state
ORDER BY venue_count DESC;

/* Insights from analyzing the venue distribution on a country and state level helps to understand that the high count of venues in the US suggests a diverse range of locations and potential opportunities for analysis and insights within the country.
The presence of 164 venues with no specified state suggests either incomplete data or venues located in territories or regions outside of US. */

-- grp
-- Explore the distribution of group visibility
SELECT
	visibility,
    COUNT(*) visibility_count
FROM
	grp
GROUP BY
	visibility;

/* The dateset primarirl consists of public groups, reflecting an emphasis on openness and inclusivity within the LetsMeet community. 
The presence of public limited groups suggests that while many groups are open, some may have additional criteria or restirction for participation.
Members-only groups, although few in number, may cater to niche communities or specific interests that require a more controlled or curated environment. */

-- grp_member
-- Aggregate Join Dates by Month
SELECT
	DATE_FORMAT(joined, '%Y-%m') AS join_month,
    COUNT(*) AS new_members
FROM
	grp_member
GROUP BY
	DATE_FORMAT(joined, '%Y-%m')
ORDER BY
	join_month;

/* The consistent addition of new members across all months and years indicates a robust and vibrant community with sustained
growth potential and opportunities for further optimization and expansion. */

-- city
SELECT
	city,
    state,
    member_count
FROM
	city
GROUP BY
	city, state
ORDER BY
	member_count DESC;

/* New York, Chicago, San Francisco have the most number of members. Other cities, although have fewer number of members, suggest that LetsMeet is spread widely all over the United States.*/
 
-- event
SELECT
	event_id,
    event_name,
    yes_rsvp_count,
    maybe_rsvp_count,
    (yes_rsvp_count + maybe_rsvp_count) total_rsvp_count,
    headcount
FROM
	event
ORDER BY
	total_rsvp_count DESC;
    
/* The lack of maybe rsvp count shows that the members are committed to attening events. But the lack of headcount means that either the data wasn't entered for after the event, or that the event wasn't successful. */

-- category
SELECT
	c.category_name,
    COUNT(DISTINCT e.event_id) AS event_count,
    SUM(e.yes_rsvp_count) AS total_yes_rsvp_count,
    SUM(e.maybe_rsvp_count) AS total_maybe_rsvp_count,
    SUM(e.yes_rsvp_count + e.maybe_rsvp_count) AS total_rsvp_count
FROM
	category AS c
LEFT JOIN
	grp g ON c.category_id = g.category_id
LEFT JOIN
	event e ON g.group_id = e.group_id
GROUP BY
	c.category_name
ORDER BY
	event_count DESC;

/* The categories of Career & Business, Art & Culture, and Book Clubs have a higher level of activity and engagement within the platform compared to other categories. 
The categoreis with zero event counts show lower member engagement and participation. */