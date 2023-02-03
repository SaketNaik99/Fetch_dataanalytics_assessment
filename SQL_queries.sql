# QUERY 1
# Which brand saw the most dollars spent in the month of June?
SELECT 
  b.name as brand_name, 
  SUM(ri.total_final_price) as sum_of_spent
FROM 
  Brands b
  JOIN Receipt_items ri ON b.brand_code = ri.brand_code
  JOIN Receipts r ON ri.rewards_receipt_id = r.id
WHERE 
  extract(month from r.purchase_date) = 6
GROUP BY 
  b.name
ORDER BY 
  total_spent DESC
LIMIT 1;


# QUERY 2
# Which user spent the most money in the month of August?
SELECT 
  r.user_id, 
  SUM(ri.total_final_price) as sum_of_spent
FROM 
  Receipts r
  JOIN Receipt_items ri ON r.id = ri.rewards_receipt_id
WHERE 
  extract(month from r.purchase_date) = 8
GROUP BY 
  r.user_id
ORDER BY 
  total_spent DESC
LIMIT 1;


# QUERY 3
# What user bought the most expensive item?
SELECT 
  r.user_id, 
  MAX(ri.total_final_price) as maximum_item_cost
FROM 
  Receipts r
  JOIN Receipt_items ri ON r.id = ri.rewards_receipt_id
GROUP BY 
  r.user_id
ORDER BY 
  max_item_price DESC
LIMIT 1;


# QUERY 4
# What is the name of the most expensive item purchased?
SELECT 
  b.name as brand_name, 
  ri.description, 
  MAX(ri.total_final_price) as max_item_price
FROM 
  Brands b
  JOIN Receipt_items ri ON b.brand_code = ri.brand_code
  JOIN Receipts r ON ri.rewards_receipt_id = r.id
GROUP BY 
  b.name, ri.description
ORDER BY 
  max_item_price DESC
LIMIT 1;


# QUERY 5
# How many users scanned in each month?
SELECT 
  extract(month from r.purchase_date) as extracted_month
  COUNT(DISTINCT r.user_id) as no_of_users
FROM 
  Receipts r
GROUP BY 
  month
ORDER BY 
  month;

