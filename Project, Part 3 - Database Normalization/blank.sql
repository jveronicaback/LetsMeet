-- Removing redundant columns
ALTER TABLE grp_member DROP COLUMN country;
/* The column country is removed from the table grp_member because it adds no new information to the table. */

ALTER TABLE venue_ DROP COLUMN phone;
/* Column phone was removed from venue_ because it does not give any information about the venue. */

ALTER TABLE city DROP COLUMN localized_country_name;
/* localized_country_name is removed from city because it does not add any new information to the table. */

ALTER TABLE event DROP COLUMN headcount;
/* headcount is removed from event table because the values in this column are zero, thus giving no information, and messing with the analysis. */

ALTER TABLE category DROP COLUMN sort_name;
/* sort_name is removed from category as the table name is confusing and has the same data as the shortname, category name. */

-- Split grp_member table
CREATE TABLE group_sign_ups AS
SELECT DISTINCT group_id, member_id, joined
FROM grp_member;

CREATE TABLE members AS
SELECT DISTINCT member_id, member_name, city, hometown, member_status
FROM grp_member;

-- Checking new tables
SELECT * FROM members;
SELECT * FROM group_sign_ups;

-- Altering members table to include a PRIMARY KEY
ALTER TABLE members
ADD PRIMARY KEY (member_id);

-- Altering group_sign_ups table
ALTER TABLE group_sign_ups
ADD CONSTRAINT fk_member_id
FOREIGN KEY (member_id) REFERENCES members(member_id);

-- Dropping a table
DROP TABLE grp_member;