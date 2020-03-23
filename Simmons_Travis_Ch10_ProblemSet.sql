--Ch10p1
--View 1
    CREATE OR REPLACE VIEW 	drivervu
 AS SELECT driverid, firstname, lastname, hiredate
    FROM driver d
    WHERE hiredate IN (SELECT hiredate
                    FROM driver
                    WHERE ups_hub_id = 3);
                    
    SELECT * FROM drivervu;
    
    SELECT firstname, lastname, hiredate
    FROM drivervu
    WHERE hiredate = '10-OCT-13';
 
--Ch10p2
--View2
    CREATE OR REPLACE VIEW 	drivervu
 AS SELECT ups_hub_id, lastname, MAX(salary) "Maximum Salary"
    FROM driver
    WHERE hiredate < '01-JUN-01'
    GROUP BY ups_hub_id, lastname
    HAVING lastname LIKE 'S%';
    
    SELECT * FROM drivervu;
    
    SELECT lastname, salary "Max Salary from Hub 1"
    FROM drivervu
    WHERE ups_hub_id = 1;
    
--Ch10p3
--Index
CREATE INDEX 	driver_salary_idx
             ON driver(salary);

--Ch10p4
--Flashback
CREATE TABLE TEMP_SP(Numbers NUMBER);
INSERT INTO TEMP_SP VALUES(42);
SELECT * FROM TEMP_SP;
DROP TABLE TEMP_SP;
SELECT * FROM TEMP_SP;
SELECT * FROM user_recyclebin WHERE original_name = 'TEMP_SP';
FLASHBACK TABLE TEMP_SP TO BEFORE DROP;
SELECT * FROM TEMP_SP;