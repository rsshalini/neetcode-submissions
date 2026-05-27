-- Write your query below

with pdt_a as (
select distinct customer_id from orders where product_name = 'A' 
),
pdt_b as (
select distinct customer_id from orders where product_name = 'B'
),
pdt_c as (
select distinct customer_id from orders where product_name = 'C'
),
pdta_b
as 
(select a.customer_id 
 from pdt_a a join pdt_b b on
a.customer_id = b.customer_id)
select a.customer_id, d.customer_name
 from pdta_b a
left join pdt_c c
on a.customer_id = c.customer_id
left join customers d
on a.customer_id = d.customer_id
where c.customer_id is null
order by d.customer_name
