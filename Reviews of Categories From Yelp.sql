-- Reviews of Categories From Yelp
-- What I got the hang of: 'UNNEST' function
-- Question: Find the top business categories based on the total number of reviews. Output the category along with the total number of reviews. Order by total reviews in descending order.

/*
Table: yelp_business


business_id: varchar
name: varchar
neighborhood: varchar
address: varchar
city: varchar
state: varchar
postal_code: varchar
latitude: float
longitude: float
stars: float
review_count: int
is_open: int
categories: varchar
*/

-- Solution

WITH categories_sub AS (
SELECT 
	review_count,
	UNNEST(STRING_TO_ARRAY(categories, ';')) AS category 
FROM yelp_business)

SELECT category, SUM(review_count) AS total_reviews 
FROM categories_sub
GROUP BY category
ORDER BY total_reviews DESC;