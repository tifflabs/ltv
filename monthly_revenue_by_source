WITH 

daily_rev AS (

  SELECT * FROM daily_revenue_per_user

)

, sub_billing_rev AS (

  SELECT * FROM billing_rev_share

)

SELECT
  account_id
  , DATE_TRUNC('month', transaction_date) AS month  
  , 'revenue' AS revenue_source
  , SUM(COALESCE(revenue, 0.0)) AS revenue
FROM daily_rev
WHERE transaction_date BETWEEN created_at AND CURRENT_DATE
GROUP BY 3

UNION ALL

SELECT
  account_id
  , month
  , 'fees' AS revenue_source
  , SUM(amount::FLOAT) AS revenue
FROM sub_billing_rev
GROUP BY 3
ORDER BY month DESC
