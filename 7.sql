-- Write a query that shows the student's name, the courses the student is taking, and the professors that teach that course.
select student_name, course_title, last_name as prof_last_name
from students s join student_enrollment se on s.student_no = se.student_no
join courses c on c.course_no = se.course_no
join teach t on t.course_no = c.course_no;

-- Let's say we only care to see a single professor teaching a course and we don't care for all the other professors 
-- that teach the particular course. Write a query that will accomplish this so that every record is distinct.
select student_name, se.course_no, min(last_name) as prof_last_name
from students s join student_enrollment se on s.student_no = se.student_no
join courses c on c.course_no = se.course_no
join teach t on t.course_no = c.course_no 
group by student_name, se.course_no
order by student_name, se.course_no;

-- Write a query that returns employees whose salary is above average for their given department.
select employee_id, department, salary
from employees e1
where salary > (select avg(salary) from employees e2 where e1.department = e2.department);

-- Write a query that returns ALL of the students as well as any courses they may or may not be taking. 
select s.student_no, student_name, course_no
from students s left join student_enrollment se
on s.student_no = se.student_no;
