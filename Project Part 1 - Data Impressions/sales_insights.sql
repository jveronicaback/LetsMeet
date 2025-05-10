-- Answer the questions from the Sales team in this file.


-- Active Cities
-- 1
SELECT
	city,
    COUNT(*)
FROM
	grp_member
WHERE
	member_status = "Active"
GROUP BY
	city
ORDER BY COUNT(*) DESC;

/* Question: What cities have active members?
Answer: The cities that have active members are: San Francisco, New York, Chicago, West New York, West Chicago, South San Francisco, North Chicago, Chicago Heights, East Chicago, Chicago Ridge.
This means that there are no active members outside of where LetsMeet is located. */

-- 2
SELECT
	state,
    grp_member.city,
    grp_member.member_status,
    COUNT(*)
FROM
	city
JOIN grp ON city.city_id = grp.city_id
JOIN grp_member ON grp.group_id = grp_member.group_id
WHERE
	grp_member.member_status = "prereg"
GROUP BY
	city;

/*Question: Are there any cities listed in the city table with no active members? If so, what state are those cities in?
Answer: Yes, The states of New York, California and Illinois have members in pre registration status i.e not active.
This tells us that LetsMeet home cities of New York, Chicago, and San Francisco have some members that are not active.*/
    

-- Groups
-- 1
SELECT
	join_mode,
    COUNT(group_id)
FROM
	grp
GROUP BY join_mode
ORDER BY COUNT(group_id) DESC;

/* Question: How many groups are currently open, waiting for approval, and/or closed?
Answer: There are 3602 open groups, 723 groups waiting for approval, and 15 closed groups. The table shows a predominantly open group environment suggesting a community emphasizing inclusivity and openness.*/    




-- Categories
SELECT
	category_name,
	COUNT(*) num_groups
FROM
	category C
JOIN grp G ON C.category_id = G.category_id
GROUP BY category_name
ORDER BY num_groups DESC
LIMIT 5;

SELECT
	category_name,
	COUNT(*) num_groups
FROM
	category C
JOIN grp G ON C.category_id = G.category_id
GROUP BY category_name
ORDER BY num_groups ASC
LIMIT 5;

/* Question: What are the five categories that contain the most groups? What are the five categories that contain the least number og groups?
Answer: Tech, Career& Business, Socializing, Health & Wellbeing, Language & Ethnic Identity contain the most groups. 
Paranormal, Cars & Motorcycles, Sci-Fi & Fantasy, Lifestyle, Hobbies & Crafts contain the least number of groups. 
The distribution of groups across categories highlights the diversity of interests and priorities within the LetsMeet community. */


-- Members
-- 1
SELECT
	COUNT(*)
FROM
	grp_member;

-- 2
SELECT
	(SELECT COUNT(*)
    FROM grp_member
    WHERE city = 'Chicago') * 100 /
    COUNT(*) percent_Chicago
FROM
	grp_member;

/* Question 1: How many members are there?
Answer 1: There are 43470 members.
Questions 2: What percentage of members are in Chicago?
Answer 2: Chicago has 20.83% of the total members.
The concentration of members from Chicago provides valueable insights for understanding the geographic distribution, engagement patterns, and potential opportunities for community building
within LetsMeet. 