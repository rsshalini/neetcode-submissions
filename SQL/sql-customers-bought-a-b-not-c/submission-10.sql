-- with orders_temp as
-- (
-- select customer_id,
-- sum(case when product_name = 'A' then 1 else 0 end) as cnt_a,
-- sum(case when product_name = 'B' then 1 else 0 end) as cnt_b,
-- sum(case when product_name = 'C' then 1 else 0 end) as cnt_c
-- from orders
-- group by 1)
-- select c.customer_id,
--        c.customer_name
-- from customers c
-- join orders_temp o
-- on c.customer_id = o.customer_id
-- where cnt_a > 0 and cnt_b > 0 and cnt_c = 0
-- order by c.customer_name


SELECT c.customer_id, c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(CASE WHEN o.product_name = 'A' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN o.product_name = 'B' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN o.product_name = 'C' THEN 1 ELSE 0 END) = 0
ORDER BY c.customer_name;