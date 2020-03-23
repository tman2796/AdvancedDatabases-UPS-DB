--Travis Simmons
--10/20/2019
--Ch8p1
SELECT e.last_name, e.job_id, d.department_name, l.city, l.state_province
FROM employees e JOIN departments d
ON d.department_id = e.department_id
JOIN locations l
ON l.location_id = d.location_id
WHERE l.location_id = 1800
ORDER BY 1;
--Ch8p2
SELECT a.animal_name || ' belongs to: ' || v.vol_first|| ' ' || v.vol_last "Animal and Volunteer",
a.animal_name || ' is a: ' || b.breed_name "Name and Breed",
b.breed_type "Breed Type"
FROM animal a JOIN volunteer v
ON a.vol_id = v.vol_id
JOIN breed b
ON a.breed_id = b.breed_id
ORDER BY 1;
--Ch8p3
SELECT b.first_name || ' ' || b.last_name "Upper Management",
CASE 
WHEN b.job_id LIKE '%VP' THEN 'Vice President'
WHEN b.job_id LIKE '%PRES' THEN 'President'
END AS "Job Title"
FROM employees a LEFT JOIN employees b
ON a.department_id = b.department_id
WHERE UPPER(a.job_id) LIKE '%AD_PRES'
ORDER BY 1;

--Ch8p4
SELECT l.city "City", c.country_name "Country"
FROM locations l FULL OUTER JOIN countries c
ON l.country_id = c.country_id
ORDER BY 1;

--ch8p5 
SELECT f.f_last || ' teaches ' || c.course_name || ' in room ' || l.room || ' in Building ' || l.bldg_code " Teaching Schedule"
FROM course_section cs JOIN faculty f
ON cs.f_id = f.f_id
JOIN course c
ON c.course_id = cs.course_id
JOIN location l
ON cs.loc_id = l.loc_id;