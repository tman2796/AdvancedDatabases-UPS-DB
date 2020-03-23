--Ch7P1
SELECT job_id "Job Title", TO_CHAR(MAX(salary),'$999,999') "Highest", TO_CHAR(MIN(salary), '$999,999') "Lowest", TO_CHAR(SUM(salary), '$999,999') "Total", COUNT(job_id) "Number of Employees"
FROM employees
GROUP BY job_id
HAVING COUNT(job_id) > 1
ORDER BY job_id;

--Ch7P2
SELECT department_id "Department", TO_CHAR(MAX(salary) - MIN(salary), '$999G999D99')"Salary Difference"
FROM employees
GROUP BY department_id
HAVING MAX(salary) - MIN(salary) > 0
ORDER BY 1;

--Ch7P3
SELECT manager_id "Manager", MIN(salary) "Smallest Salary in Group"
FROM employees
--WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING COUNT(manager_id) > 0 AND (MIN(salary) >= 6000)
ORDER BY 2 DESC;

--Ch7P4
SELECT c_sec_day "Days",
TO_CHAR(c_sec_time, 'HH:MI a.m.')"Time",
COUNT(*) "Number of Classes"
FROM course_section
GROUP BY c_sec_day, c_sec_time
ORDER BY 1, 2;

--Ch7P5
SELECT CASE
WHEN c_sec_day = 'MTWRF' THEN 'Every Day of the Week'
WHEN c_sec_day = 'MWF' THEN 'Mon - Wed - Fri'
WHEN c_sec_day = 'TR' THEN 'Tues - Thurs'
END AS "Days",
LTRIM(TO_CHAR(c_sec_time, 'HH:MI a.m.'),0)"Time",
COUNT(*) "Number of Classes"
FROM course_section
GROUP BY c_sec_day, c_sec_time
ORDER BY 1,2;