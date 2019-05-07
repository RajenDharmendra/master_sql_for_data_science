--Write a query that finds students who do not take CS180.
select * from students where student_no in
(select distinct student_no
from student_enrollment
where course_no != 'CS180');

--Write a query to find students who take CS110 or CS107 but not both.
select * from students
where student_no in 
(select student_no 
from student_enrollment
where course_no = 'CS110')
or student_no in
(select student_no 
from student_enrollment
where course_no = 'CS107');

--Write a query to find students who take CS220 and no other courses.
select * from students
where student_no in 
(select student_no from student_enrollment
where course_no = 'CS220')
and student_no not in
(select student_no 
from student_enrollment
where course_no != 'CS220');

--Write a query that finds those students who take at most 2 courses.
--Your query should exclude students that don't take any courses as well as those  that take more than 2 course. 
from students where student_no in
(select student_no
from student_enrollment
group by student_no
having count(course_no) = 2);
select * 
from students where student_no in
(select student_no
from student_enrollment
group by student_no
having count(course_no) <= 2);

--Write a query to find students who are older than at most two other students.
