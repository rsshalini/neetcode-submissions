-- Write your query below

select u.name, coalesce(sum(distance),0) as travelled_distance
from users u
left join rides r
on r.user_id = u.id
group by 1
order by 2 desc
