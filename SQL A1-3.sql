/* Assn2, Task2, Qn1)			*/
SELECT s.employee_id, s.first_name, s.last_name, s.hire_date, s.salary, COUNT(*) Number_of_Employees
FROM EMPLOYEE s JOIN EMPLOYEE e
				ON s.employee_id = e.supervisor_id
				GROUP BY s.employee_id;
/* End of Assn2, Task2, Qn1)			*/

/* Assn2, Task2, Qn2)			*/
SELECT employee_id, first_name, last_name, job_title
FROM EMPLOYEE 
WHERE department_name IN (	SELECT department_name
							FROM DEPARTMENT
							WHERE country_name = 'Japan');
/* End of Assn2, Task2, Qn2)			*/

/* Assn2, Task2, Qn3)			*/
SELECT employee_id, first_name, last_name
FROM EMPLOYEE
WHERE employee_id IN (	SELECT employee_id
						FROM JOBHISTORY
						WHERE department_name ='Shipping' AND DATEDIFF(end_date, start_date) > 1000
					);
/* End of Assn2, Task2, Qn3)			*/

/* Assn2, Task2, Qn4)			*/
UPDATE EMPLOYEE
SET EMPLOYEE.supervisor_id = ( SELECT supervisor_id  FROM (
								SELECT supervisor_id FROM EMPLOYEE e
								WHERE e.employee_id = 101)emptbl)
WHERE supervisor_id = '101';

DELETE FROM JOBHISTORY
WHERE employee_id = '101';

DELETE FROM EMPLOYEE
WHERE employee_id = '101';
/* End of Assn2, Task2, Qn4)			*/

/* Assn2, Task2, Qn5)			*/
INSERT INTO JOB VALUES
('SEO Analyst', '8000', '15000');
INSERT INTO EMPLOYEE VALUES
('207', 'JD', 'ANDERSON', 'JD.ANDERSON@XMAIL.COM', NULL, STR_TO_DATE('11-04-2022', '%d-%m-%Y'), 'SEO Analyst', '9988', NULL, '201', 'MARKETING');
/* End of Assn2, Task2, Qn5)			*/

