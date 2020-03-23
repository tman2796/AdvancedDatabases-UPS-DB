-- Drop Tables for mulitple runs

Drop Table Package_;
Drop Sequence Package_seq;
Drop Table Driver_UPS_Store;
Drop SEQUENCE Driver_Seq;
Drop Table Driver;
Drop SEQUENCE Customer_Seq;
Drop Table Customer;
Drop SEQUENCE UPS_Hub_Seq;
Drop Table UPS_Hub;
--Drop SEQUENCE UPS_Store_Seq;
Drop Table UPS_Store;

-- Create UPS_Store Table

Create Table UPS_Store
(UPS_Store_ID INT,
street_address VARCHAR(45),
city VARCHAR(20),
state_ CHAR(2),
zip CHAR(5),
phone_Number NUMBER(10),
CONSTRAINT UPS_Store_ID_pk PRIMARY KEY (UPS_Store_ID));

-- Create Sequence for UPS Store

--Create SEQUENCE UPS_Store_Seq
--START WITH 1
--INCREMENT BY 1;

-- Create UPS Hub Table

Create Table UPS_Hub
(UPS_Hub_ID INT,
packages_ NUMBER,
street_Address VARCHAR(30),
state_ CHAR(2),
zip NUMBER(5),
city VARCHAR(20),
CONSTRAINT UPS_Hub_ID_pk PRIMARY KEY (UPS_Hub_ID));

-- Create Sequence for UPS Hub

Create SEQUENCE UPS_Hub_Seq
START WITH 1
INCREMENT BY 1;

-- Create Customer Table

Create Table Customer
(customerID INT,
firstName VARCHAR(30),
lastName VARCHAR(30),
UPS_Store_ID INT,
customer_Phone_Number NUMBER(10),
street_Address VARCHAR(30),
state_ CHAR(2),
zip NUMBER(5),
city VARCHAR(20),
CONSTRAINT customerID_pk PRIMARY KEY (customerID),
CONSTRAINT Customer_UPS_Store_ID_fk FOREIGN KEY (UPS_Store_ID)
REFERENCES UPS_Store(UPS_Store_ID));

-- Create Sequence for Customer

Create SEQUENCE Customer_Seq
START WITH 1
INCREMENT BY 1;

-- Create Driver Table

Create Table Driver
(driverID INT,
firstName VARCHAR(20),
lastName VARCHAR(20),
hireDate DATE,
UPS_Hub_ID INT,
phone_Number NUMBER(10),
CONSTRAINT UPS_Hub_ID_fk FOREIGN KEY (UPS_Hub_ID)
REFERENCES UPS_Hub (UPS_Hub_ID),
CONSTRAINT driverID_pk PRIMARY KEY (driverID));

-- Create Sequence for Driver

Create SEQUENCE Driver_Seq
START WITH 1
INCREMENT BY 1;

-- Create Driver_UPS_Store Table

Create Table Driver_UPS_Store
(driverID INT,
CONSTRAINT Driver_UPS_Store_PK Primary Key (driverID, UPS_Store_ID),
UPS_Store_ID INT,
CONSTRAINT driverID_fk FOREIGN KEY (driverID)
REFERENCES Driver (driverID),
CONSTRAINT Driver_UPS_Store_ID_fk FOREIGN KEY (UPS_Store_ID)
REFERENCES UPS_Store (UPS_Store_ID));

-- Create Package_ Table

Create Table Package_
(driverID INT,
customerID INT,
CONSTRAINT Driver_Customer_PK Primary Key (driverID, customerID),
CONSTRAINT Package_DriverID_fk FOREIGN KEY (driverID)
REFERENCES Driver (driverID),
CONSTRAINT customerID_fk FOREIGN KEY (customerID)
REFERENCES Customer (customerID));

Create SEQUENCE Package_seq
START WITH 1
INCREMENT BY 1;

COMMIT;

--Insert data into UPS Store
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (1010, '306 Exchange Blvd', 'Bethlehem', 'Ga', '30625', 6547897899);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (6666, '823 Stinky Hwy', 'Jefferson', 'Ga', '30625', 6789876541);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (7777, 'Douthit Rd', 'Blue', 'Ga', '30001', 1234567890);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (9999, '23 Random Dr', 'Ridge', 'Ga', '32212', 5554446666);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (8888, '555 Bank cir', 'Johnnyville', 'Ga', '30021', 7778889999);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (5555, '333 Iron Man Blvd', 'Marvel', 'Ga', '30303', 1234445555);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (4444, '888 No See Way', 'Blink', 'Ga', '31313', 3214578888);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (3333, '546 Darth Vader Ct ', 'DeathStar', 'Ga', '32322', 9998887777);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (2222, 'Mountain Square Cir', 'Athens', 'Ga', '32222', 1112223333);
INSERT INTO ups_store(UPS_Store_ID, Street_Address, City, State_, zip, Phone_Number)
VALUES (1111, '456 Drive Ridge Rd', 'Snellville', 'Ga', '33333', 4445521366);

SELECT * FROM ups_store;

--Insert data into Customer--
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'Riley', 'Simmons',  1111, 6784460889, '500 Road Blvd', 'Ga', '30000' ,'Snellville');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'John', 'Smith', 1010, 6780000889, '500 Smelly Blvd', 'Ga', '30656' ,'Jefferson');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'Erdley', 'Durden', 3333, 6789980213, '900 Exchange Blvd', 'Ga', '30658' ,'Dawsonville');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'LaLa', 'Simmons', 4444, 7702896548, '800 Borderland Rd', 'Ga', '30214' ,'Pope');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'Dan', 'Ferrell', 9999, 4046587989, 'Douthit Dr', 'Ga', '32221' ,'Athens');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'Will', 'Ferrell', 2222, 8006661234, '89 Payne Pointe Crest', 'Ga', '32203' ,'Atlanta');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'Brad', 'Pitt', 1111, 7065467896, '606 Halo Way', 'Ga', '33333' ,'Gainesville');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'Chris', 'Pratt', 5555, 1234567890, '343 Spartan Dr', 'Ga', '30012' ,'Suwannee');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'David', 'Chappelle', 6666, 9874561230, '117 John Locke Ct', 'Ga', '30123' ,'Winder');
INSERT INTO Customer (CustomerID, firstName, lastName, UPS_Store_ID, Customer_Phone_Number, Street_Address, State_, Zip, City)
VALUES (customer_seq.nextval, 'Chris', 'Evans', 9999, 6541236547, '306 Exchange Blvd', 'Ga', '30635' ,'Bethlehem');

SELECT * FROM customer;

--INSERT data into UPS_Hub
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (2, 500, '225 Perry Platypus Dr', 'GA', 30652, 'Jacksonville');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (3, 500, '89854 John Smith Jr Dr', 'GA', 32102, 'Bogart');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (4, 500, '500 Darth Vader Pkwy', 'GA', 32323, 'Athens');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (5, 500, '999 Salad Way', 'GA', 33333, 'Atlanta');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (6, 500, '3221 Zaxbys Yum Ter', 'GA', 32010, 'Lawrenceville');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (7, 500, '626 Stitch Disney Blvd', 'GA', 32125, 'Dacula');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (8, 500, '343 Master Chief Ln', 'GA', 30212, 'Bethlehem');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (9, 500, '100 Pine St', 'GA', 30323, 'Gratis');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (10, 500, '231054 Big Building Pl', 'GA', 30012, 'Monroe');
INSERT INTO UPS_Hub(ups_hub_id, packages_,street_address, state_, zip, city)
VALUES (1, 500, '54689 Longville Hwy', 'GA', 30000, 'Smyrna');

SELECT * FROM ups_hub;

--Insert data into Driver
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (1, 'Rick', 'Flare', '01-Feb-02', 1, 6457899999);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (2, 'Matt', 'Damon', '20-Jan-10', 2, 6321234567);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (3, 'Tony', 'Stark', '14-Aug-89', 3, 8887779999);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (4, 'Peter', 'Griffin', '05-Jul-17', 4, 1112223333);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (5, 'Stan', 'Marsh', '10-Oct-13', 5, 1234565555);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (6, 'Butters', 'Stotch', '15-Mar-11', 6, 7778887777);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (7, 'Rick', 'Sanchez', '19-Sep-09', 7, 0001113333);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (8, 'Morty', 'Sanchez', '25-Nov-05', 8, 2220001111);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (9, 'Eric', 'Cartman', '23-Dec-18', 9, 3232323221);
INSERT INTO Driver(driverID, firstName, lastName, hireDate, UPS_Hub_ID, phone_Number)
VALUES (10, 'Randy', 'Marsh', '12-Jun-03', 10, 4445552020);

SELECT * FROM driver;

--Insert data into Package_ NEED HELP
INSERT INTO Package_(driverID, CustomerID)
VALUES (1, 10);
INSERT INTO Package_(driverID, CustomerID)
VALUES (2, 9);
INSERT INTO Package_(driverID, CustomerID)
VALUES (3, 8);
INSERT INTO Package_(driverID, CustomerID)
VALUES (4, 7);
INSERT INTO Package_(driverID, CustomerID)
VALUES (5, 6);
INSERT INTO Package_(driverID, CustomerID)
VALUES (6, 5);
INSERT INTO Package_(driverID, CustomerID)
VALUES (7, 4);
INSERT INTO Package_(driverID, CustomerID)
VALUES (8, 3);
INSERT INTO Package_(driverID, CustomerID)
VALUES (9, 2);
INSERT INTO Package_(driverID, CustomerID)
VALUES (10, 1);

SELECT * FROM package_;

--INSERT data into Driver_UPS_Store NEED HELP
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (1, 1111);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (2, 1010);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (3, 9999);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (4, 8888);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (5, 7777);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (6, 6666);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (7, 5555);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (8, 4444);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (9, 3333);
INSERT INTO driver_ups_store(DriverID, ups_store_id)
VALUES (10, 2222);

SELECT * FROM driver_ups_store;

Commit;

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