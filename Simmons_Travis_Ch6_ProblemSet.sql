--Ch6p1
SELECT last_name || ' earns ' || TO_CHAR(salary, 'fmL9999G900D00') || ' monthly but wants ' || TO_CHAR(salary * 3, 'fmL9999G990D00') "Dream Salaries",
TO_CHAR(hire_date, 'Month DD, YYYY') "Date Hired"
FROM employees
WHERE hire_date < ADD_MONTHS(sysdate, - (12 * 16))
ORDER BY salary;

--Ch6p2
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 12), 'MONDAY'),
'fmDay, "the" Ddspth "of" Month, YYYY')
FROM employees
WHERE job_id LIKE 'AD%'
ORDER BY last_name;

--Ch6p3
SELECT animal_name "Name", animal_age || ' Years'  "Age", animal_weight || ' lbs' "Weight",
CASE 
WHEN animal_weight <= 15 THEN 'CITY'
WHEN animal_weight >= 15 AND animal_weight <= 40 THEN 'SUBURB'
ELSE 'RURAL'
END AS "Ideal Residence"
FROM animal
WHERE arrival_date > '01-MAR-2018'
ORDER BY animal_weight;

--Ch6p4
SELECT bldg_code "Building", room "Room",
CASE WHEN capacity>=100 THEN 'Large'
WHEN capacity > 30 AND capacity < 99 THEN 'Medium'
WHEN capacity < 30 THEN 'Small'
END "Capacity"
FROM location
ORDER BY capacity DESC, bldg_code;

--Ch6p5
SELECT call_id, course_name, 
CASE 
WHEN SUBSTR(call_id,-3,1) = '1' THEN 'Freshman'
WHEN SUBSTR(call_id,-3,1) = '2' THEN 'Sophomore'
WHEN SUBSTR(call_id,-3,1) = '3' THEN 'Junior'
WHEN SUBSTR(call_id,-3,1) = '4' THEN 'Senior'
END AS "LEVEL"
FROM course
ORDER BY call_id;
