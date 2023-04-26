WITH 

time_per_user AS (

  SELECT * FROM time_per_user

)

, users AS (

  SELECT * FROM user_detail

)

, rev AS (

  SELECT * FROM daily_revenue_per_hour') }}

)

SELECT
  time_per_user.fees_date
  , users.account_id
  , time_per_user.user_id
  , SUM(ad_rev.ad_revenue_per_hour_watched * hours_per_user.hours_per_user) AS daily_revenue
FROM time_per_user
JOIN users ON (time_per_user.user_id = users.user_id)
LEFT JOIN ad_rev ON (time_per_user.engagement_date = rev.event_date)
GROUP BY 3
