-- Write your query below
with temp as 
(select *, row_number()over(partition by student_id order by score desc, exam_id) as rn
 from exam_results)
 select student_id, exam_id, score from temp 
 where rn =1

