CREATE TABLE applestore_desc_all AS

SELECT * FROM appleStore_description1

UNION ALL

SELECT * FROM appleStore_description2

UNION ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4;

--    EDA

-- CHECK FOR NUMBER OF UNIQUE APPS

SELECT COUNT(DISTINCT id) 
FROM AppleStore;
-- 7197

SELECT COUNT(DISTINCT id)
from applestore_desc_all;
-- 7197

-- CHECK FOR MISSING VALUES IN SOME OF THE KEY FIELDS

SELECT COUNT(*) as missing_values FROM AppleStore
WHERE track_name IS null OR user_rating IS null OR prime_genre IS null;

SELECT COUNT(*) AS missing_Values FROM applestore_desc_all
where app_desc is null;

-- NO. OF APPS PER GENRE 
SELECT prime_genre, COUNT(*) as Num_of_Apps
FROM AppleStore
GROUP by prime_genre
ORDER by Num_of_Apps DESC;

-- ABOUT USER RATINGS 
SELECT MAX(user_rating) as max_rating, MIN(user_rating) as min_rating, AVG(user_rating) as average_rating
from AppleStore;


-- FURTHER ANALYSIS

-- CHECK IF PAID APPS HAVE HIGHER RATING THAN FREE ONES 

SELECT CASE 
            WHEN price > 0 THEN 'Paid'
            ELSE 'Free'
       END AS App_Type,
       avg(user_rating) as Average_Rating
FROM AppleStore
GROUP BY App_Type;

-- CHECK THE NUMBER OF PAID AND FREE APPS 

SELECT case 
            when price > 0 then 'Paid'
            else 'Free'
       end as App_Type,
       count(price) as Number_of_Apps
FROM AppleStore
group by App_Type;

-- CHECK IF APPS WITH HIGHER SUPPORTED LANGUAGES HAVE HIGHER RATING 

SELECT CASE
            WHEN lang_num < 10 THEN '<10 languages'
            When lang_num BETWEEN 10 and 30 THEN '10-30 languages'
            ELSE '>30 languages'
       END as Languages,
       avg(user_rating) as Average_Rating
FROM AppleStore
GROUP BY Languages
ORDER by Average_Rating DESC;


-- FIND TOP 10 GENRES WITH LOW RATING 

SELECT prime_genre AS App_Genre, avg(user_rating) as Average_Rating
FROM AppleStore
GROUP by prime_genre
order by Average_Rating
limit 10;


-- CHECK FOR CORRELATION B/W APP DESCRIPTION AND APP RATING

SELECT CASE
            WHEn length(b.app_desc) < 500 THEN 'Short'
            when length(b.app_desc) BETWEEN 500 and 1000 THEN 'Medium'
            ELSE 'Long'
       end as Desc_Length,
       avg(a.user_rating) as Average_Rating

FROM AppleStore as a 
JOIN applestore_desc_all as b 
on a.id = b.id

GROUP by Desc_Length
order by Average_Rating DESC;


-- FIND THE TOP-RATED APPS FOR EACH GENRE 

SELECT prime_genre, track_name, user_rating
FROM (
  SELECT prime_genre, track_name, user_rating, 
         RANK() OVER(Partition by prime_genre ORDER by user_rating desc, rating_count_tot desc) as rank
         from AppleStore
     ) as a 
     
WHERE a.rank = 1;
        
        



