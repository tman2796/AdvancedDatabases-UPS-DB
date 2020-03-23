--Query1
SELECT firstname || ' ' || lastname "Customer Name", ups_store_id "Store Number"
FROM customer
WHERE ups_store_id = 1111 OR ups_store_id = 9999
ORDER BY ups_store_id;
--Gets the name of the customers that go to either store id 9999 or store id 1111 and orders by store id

--Query2
SELECT driverid "Driver ID", ups_store_id "UPS Store Number"
FROM driver_ups_store
WHERE ups_store_id = '&ups_store_id' OR ups_store_id LIKE '%1'
ORDER BY ups_store_id;
--Gets the driver ID that the user entered store number and the store number that starts with "1" and is ordered by store id

--Query3
SELECT ups_Store_id "UPS Store Number", street_address "Street Address", city, state_ "State", zip
FROM ups_store
WHERE ups_store_id BETWEEN 1111 AND 5555
ORDER BY ups_Store_id
FETCH FIRST 3 ROWS ONLY;
--Gets the UPS Store ID and the address info for each store with the ID's between 1111 and 5555 and fetches the first 3 rows only

--Query4
SELECT firstname || ' ' || lastname "Customer Name", LPAD(SUBSTR(customer_phone_number,7,4),10,'*') "Last 4 digits of phone number"
FROM customer
ORDER BY lastname;
--Gets the customer first and last name and the last 4 digits of their phone number to uniqely 
--identify each customer and pads where the msising numbers are
--Then orders by last names of the customers

--Query5
SELECT firstname || ' ' || lastname "Driver Name",
hiredate "Date Hired",
TRUNC(MONTHS_BETWEEN(sysdate , hiredate)/12) "Years since being hired",
NEXT_DAY(hiredate, 'MONDAY') "First Monday Worked Date" 
FROM driver
WHERE SUBSTR(firstname,1) LIKE 'R%' OR SUBSTR(firstname,1) LIKE 'T%';
--Gets the driver first and last name, date hired and years since being hired as well as the first monday they started
--and only gets the drivers that their first name starts with the letter R and T

--Query6
SELECT firstname || ' ' || lastname "Driver Name", TO_CHAR(hiredate,'fmDay, Month ddth, YYYY' ) "Hire Date", phone_number "Contact Number"
FROM driver
WHERE hiredate < ADD_MONTHS(sysdate, - (12 * 5))
ORDER BY lastname DESC;
--Retrieves the contact info for the drivers that have been 
--hired for 5 years and over the current date of the run

--Query7
SELECT firstname || ' ' || lastname "Customer Name", customerID "Customer ID", ups_store_id "Store ID", customer_phone_number "Customer Phone Number",
CASE
WHEN TO_CHAR(ups_store_id) <= '4%' THEN 'Barrow County'
WHEN TO_CHAR(ups_store_id) >= '4%' AND TO_CHAR(ups_store_id) <= '7%' THEN 'Gwinnett County'
WHEN TO_CHAR(ups_store_id) >='8%' THEN 'Walton County'
END AS "Store Location"
FROM customer
ORDER BY lastname;
--Gets the customer contact info and that determines which county their ups store is in

--Query8
SELECT TO_CHAR(MAX(salary), '$999,999') "Salary", ups_hub_id "Hub ID"
FROM driver
WHERE salary > 0
GROUP BY salary, ups_hub_id
ORDER BY ups_hub_id DESC;
--Displays the different salary ranges per ups hubs. 
--So Hub 3 has salary ranges from 35,000 and 70,000 and so on

--Query9
SELECT ups_hub_id "Hub ID", salary "Salary"
FROM driver
WHERE hiredate < TO_DATE('01-JAN-17')
GROUP BY ups_hub_id, salary
HAVING salary < 70000
ORDER BY salary;
--Gets the salaries that are lower than 70,000 that is at each hub displayed with 
--a hire date of older than janurary first 2017

--Query10
SELECT d.firstname || ' ' || d.lastname "Driver Name",
'Store Number: ' || u.ups_store_id || ' Street Address: ' || u.street_address "Driver Picks up at"
FROM driver_ups_store du INNER JOIN driver d
ON du.driverid = d.driverid
JOIN ups_store u
ON u.ups_store_id = du.ups_store_id
ORDER BY 1;
--Displays the UPS Store address that each driver picks up at along with their store number

--Query11
SELECT c.firstname || ' ' || c.lastname "Customer",
c.city "Customer resides in",
u.city "City of Store",
u.ups_store_id "Store ID"
FROM ups_store u RIGHT OUTER JOIN customer c
ON u.ups_store_id = c.ups_store_id
ORDER BY 1;
--This query pulls customer names and displays the city they reside 
--in and which ups store they use in which city

--Query12
SELECT firstname || ' ' || lastname "Driver", ups_hub_id "Hub"
FROM driver
WHERE driverid = (SELECT driverid
                FROM driver_ups_store
                WHERE ups_store_id = 1111)
ORDER BY 1;
--This query gets the driver's name that picks up at the given store id and returns their hub id as well

--Query13
SELECT ups_hub_id "Hub", salary "Maximum Salary of Drivers"
FROM driver 
WHERE salary > ANY (SELECT MAX(salary)
                    FROM driver
                    WHERE ups_hub_id = 2)
ORDER BY salary;
--This query gets salaries that are higher than any of the salaries in Hub id 2

--Query14
SELECT hub_to_driver_id "Driver ID", ups_hub_id "Hub ID"
FROM ups_hub
UNION
SELECT driverid, ups_hub_id
FROM driver;
--Displays which hubs which drivers go to and pick up packages at.

--Query15
SELECT ups_store_id "Store ID"
FROM ups_store
INTERSECT
SELECT ups_store_id
FROM customer;
--Gets the store numbers that the customers go to.