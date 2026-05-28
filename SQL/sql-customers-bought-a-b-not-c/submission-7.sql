-- Write your query below
with
pdt_a as (select distinct customer_id from orders where product_name = 'A'),
pdt_b as (select distinct customer_id from orders where product_name = 'B'),
pdt_c as (select distinct customer_id from orders where product_name = 'C')

select a.customer_id, b.customer_name from pdt_a a
left join
customers b
on a.customer_id = b.customer_id
where a.customer_id in (select * from pdt_b)
and a.customer_id not in (select * from pdt_c)
order by b.customer_name