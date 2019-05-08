--Write a query that finds students who do not take CS180.
select * from students
where student_no not in 
(select student_no
from student_enrollment
where course_no = 'CS180');

--Write a query to find students who take CS110 or CS107 but not both.
select s.student_no, s.student_name, s.age
from students s, student_enrollment se
where s.student_no = se.student_no
group by s.student_no, s.student_name, s.age
having sum(case when se.course_no in ('CS110', 'CS107') then 1 else 0 end) = 1;

--Write a query to find students who take CS220 and no other courses.
select s.*
from students s, student_enrollment se
where s.student_no = se.student_no
and s.student_no not in 
(select student_no from student_enrollment where course_no != 'CS220');

--Write a query that finds those students who take at most 2 courses.
--Your query should exclude students that don't take any courses as well as those  that take more than 2 course. 
select s.student_no, s.student_name, s.age
from students s, student_enrollment se
where s.student_no = se.student_no
group by s.student_no, s.student_name, s.age
having count(*) <= 2;

--Write a query to find students who are older than at most two other students.
select s1.*
from students s1
where 2 >= (select count(*) from students s2 where s2.age < s1.age);
