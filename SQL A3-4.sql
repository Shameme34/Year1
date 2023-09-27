-- /*Assn3, Task 2 Part B, Qn(1)		*/
-- set global general_log = 'ON';

-- /*Assn3, Task 2 Part B, Qn(2)		*/
-- truncate TABLE mysql.general_log;
-- set global log_output = 'TABLE';

-- /*Assn3, Task 2 Part B, Qn(3)		*/
-- execute script file A3change2b.sql

-- /*Assn3, Task 2 Part B, Qn(4)		*/
-- set global general_log = 'OFF';

-- /*Assn3, Task 2 Part B, Qn(5)		*/
select substr(convert (argument using utf8) ,1,locate(' ', argument)) AS argument, count(*)
from mysql.general_log
 where argument like '%CREATE%'
	or argument like '%ALTER%'
	or argument like '%DROP%'
group by substr(convert (argument using utf8) ,1,locate(' ', argument));

-- /*Assn3, Task 2 Part B, Qn(6)		*/
select convert (argument using utf8)AS argument
from mysql.general_log
 where argument like '%SELECT%'
	or argument like '%INSERT%'
	or argument like '%DELETE%'
    or argument like '%UPDATE%';



