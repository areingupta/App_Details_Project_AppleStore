# SQL Project on Analysis of Key Metrics related to Apps available on App Store

1) This project puts to use a series of SQL queries to reveal some important Data related knowledge that might be useful for some potential Developer client who might be interested in launching a new product or expanding its current portfolio of Applications.

2) It reveals insights on some important factors such as-

   a) Genre Saturation

   b) User Ratings on Apps

   c) Impact on Ratings if Apps are either paid or free

   d) Impact on Ratings depending on Language Support of Apps

   e) Genres with least rated apps

   f) Top Applications in each Genre etc.

3) On the basis of the Outcomes and Observations, the following Recommendations can be made:

   a) From query for apps per genre -

   It is found that there's a high degree of saturation in genres like Gaming, Education, Entertainment etc. Thus it would be difficult to launch another product in them. Despite quality, there's a chance that the application might not gain traction due to high competetiveness.

   Instead the Developer could target low saturated genres like Navigation and Business.

   ![Model](Query_Results/app_per_genre_1.png)
   ![Model](Query_Results/apps_per_genre_2.png)

   b) From query for User Ratings (Max, Min, and Average) -

   The average app rating across all apps is ~3.52, thus the developer should target to reach a minimum threshold of this value.

   ![Model](Query_Results/total_ratings.png)

   c) For query on relation between paid/free apps and user rating -

   ![Model](Query_Results/payment_type.png)

   d) For query about language supports

   ![Model](Query_Results/language_support_ratings.png)

   e) For query about description length and associated user ratings

   ![Model](Query_Results/descp_length_rating.png)

   f) 
