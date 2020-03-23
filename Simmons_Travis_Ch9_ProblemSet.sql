--Travis Simmons
--11/04/2019
--Ch9p1
SELECT s_first || ' ' || s_last "Enrolled Student"
FROM student
WHERE s_id IN (SELECT s_id
        FROM enrollment);

--Ch9p2
SELECT employee_id || ': ' || last_name "Employee",  salary "Equal To Average for Department"
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM departments
                        WHERE location_id IN (SELECT location_id
                                        FROM locations
                                        WHERE UPPER(city) LIKE '%SAN FRAN%'))
                    AND salary > (SELECT AVG(salary)
                    FROM employees)
ORDER BY salary DESC;
--Ch9p3
SELECT e.last_name "Employee Last Name",
d.department_name "Department",
e.salary "Equal to Average for Department"
FROM employees e JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (SELECT AVG(salary)
                FROM employees sub
                WHERE e.department_id = sub.department_id)
ORDER BY 1;
--Ch9p4
SELECT first_name || ' ' || last_name || ' earns ' || TO_CHAR(salary, 'fmL999G999') "Better Than Manager's Salary"
FROM employees
WHERE job_id LIKE 'SA_REP' AND salary > ANY (SELECT salary
                                            FROM employees
                                            WHERE job_id LIKE '%MAN%' OR job_id LIKE '%MGR%')
ORDER BY salary DESC;
--Ch9p5
SELECT last_name "Colleague", hire_date "Date Hired", department_id "Department ID"
FROM employees
WHERE department_id = (SELECT department_id
                        FROM employees
                        WHERE last_name = INITCAP('&last_name'))
ORDER BY 1;