-- /*Assn3, Task 1 Part A, Qn(1)			*/
create user sdsa947_1 identified by 'sdsa947_1';
create user sdsa947_2 identified by 'sdsa947_2';

-- /*Assn3, Task 1 Part A, Qn(2)			*/
grant create,alter,drop,insert,delete,update on sdsa947.* to sdsa947_1;

-- /*Assn3, Task 1 Part A, Qn(3)			*/
grant select on sdsa947.PRESCRIPTION to sdsa947_2 with grant option;
grant select on sdsa947.PATIENT to sdsa947_2 with grant option;
grant select on sdsa947.DOCTOR to sdsa947_2 with grant option;

-- /*Assn3, Task 1 Part A, Qn(4)			*/
alter user sdsa947_1 WITH MAX_QUERIES_PER_HOUR 50
						  MAX_UPDATES_PER_HOUR 10
                          MAX_CONNECTIONS_PER_HOUR 55;

-- /*Assn3, Task 1 Part A, Qn(5)			*/
alter user sdsa947_1 password expire;

-- /*Assn3, Task 1 Part A, Qn(6)			*/
select user, db, insert_priv, update_priv, delete_priv, drop_priv, alter_priv, create_priv
from mysql.db
where user IN ('sdsa947_1', 'sdsa947_2');

select user, db, table_name, table_priv
from mysql.tables_priv
where user IN ('sdsa947_2');

select user, max_updates, max_questions, max_updates, max_connections
from mysql.user
where user IN ('sdsa947_1', 'sdsa947_2');

select user, password_expired
from mysql.user
where user IN ('sdsa947_1');

