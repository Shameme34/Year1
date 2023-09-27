create table BROKERAGEFIRM(
branch_num		CHAR(10)		NOT NULL,
name			VARCHAR(50)		NOT NULL,
address			VARCHAR(50)		NOT NULL,
phone			VARCHAR(20)		NOT NULL,
supervisor		VARCHAR(50)		NOT NULL,
operating_hours	VARCHAR(50)		NOT NULL,
CONSTRAINT BROKERAGEFIRM_PK PRIMARY KEY(branch_num),
CONSTRAINT BROKERAGEFIRM_CK UNIQUE(name)
);

create table STAFF(
branch_num	CHAR(10)		NOT NULL,
staff_num	CHAR(5)			NOT NULL,
name		VARCHAR(50)		NOT NULL,
dob			DATE			NOT NULL,
address		VARCHAR(50)		NULL,
gender		CHAR(1)			NOT NULL,
salary		DECIMAL(10,2)	NOT NULL,
email		VARCHAR(50)		NULL,
CONSTRAINT STAFF_PK PRIMARY KEY(branch_num, staff_num),
CONSTRAINT STAFF_FK FOREIGN KEY(branch_num)
	REFERENCES BROKERAGEFIRM(branch_num)
);

create table CLIENT(
branch_num	CHAR(10)		NOT NULL,
client_num	CHAR(10)		NOT NULL,
name		VARCHAR(50)		NOT NULL,
dob			DATE			NULL,
gender		CHAR(1)			NOT NULL,
address		VARCHAR(50)		NOT NULL,
phone		VARCHAR(20)		NULL,
CONSTRAINT CLIENT_PK PRIMARY KEY(branch_num, client_num),
CONSTRAINT CLIENT_FK FOREIGN KEY(branch_num)
	REFERENCES BROKERAGEFIRM(branch_num)
);

create table ACCOUNT(
account_num	CHAR(10)		NOT NULL,
client_num	CHAR(10)		NOT NULL,
branch_num	CHAR(10)		NOT NULL,
type		VARCHAR(20)		NOT NULL,
balance		DECIMAL(8,2)	NOT NULL,
CONSTRAINT ACCOUNT_PK PRIMARY KEY(account_num, client_num),
CONSTRAINT ACCOUNT_FK FOREIGN KEY(branch_num,client_num)
	REFERENCES CLIENT(branch_num, client_num)
);

/*Assn2, Task1, Qn(i)	*/
ALTER TABLE CLIENT ADD COLUMN country_of_origin VARCHAR(55);
ALTER TABLE CLIENT ADD COLUMN passport_number VARCHAR(22);
/*End of Assn2, Task1, Qn(i)	*/

/*Assn2, Task1, Qn(ii)	*/
ALTER TABLE ACCOUNT DROP FOREIGN KEY ACCOUNT_FK;
ALTER TABLE ACCOUNT ADD CONSTRAINT ACCOUNT_FK
	FOREIGN KEY (branch_num, client_num) 
		REFERENCES CLIENT(branch_num, client_num) ON UPDATE CASCADE;
/*End of Assn2, Task1, Qn(ii)	*/

/*Assn2, Task1, Qn(iii)	*/
ALTER TABLE STAFF MODIFY COLUMN salary  DECIMAL(8,2);
/*End of Assn2, Task1, Qn(iii)	*/
        
/*Assn2, Task1, Qn(iv)	*/
ALTER TABLE ACCOUNT MODIFY COLUMN type VARCHAR(40);
/*End of Assn2, Task1, Qn(iv)	*/