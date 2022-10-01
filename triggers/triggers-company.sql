/* 
 * Commands used to create a simple trigger between 2 tables: Employees and Employee_Audit
 * Usage: 
 *   sudo su postgres
 *   psql
 *   \i triggers-company.sql
 */

/* Remove all the tables in 'public'  schema */
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/* Remove all existing tables */
DROP TABLE IF EXISTS COMPANY;
DROP TABLE IF EXISTS AUDIT;

/* Create table 'COMPANY' */
CREATE TABLE COMPANY (
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

/* Create table 'AUDIT' */
CREATE TABLE AUDIT (
   EMP_ID INT NOT NULL,
   ENTRY_DATE TEXT NOT NULL
);

/* Create function 'auditlogfunc' */
CREATE OR REPLACE FUNCTION auditlogfunc() RETURNS TRIGGER AS $example_table$
   BEGIN
      INSERT INTO AUDIT(EMP_ID, ENTRY_DATE) VALUES (new.ID, current_timestamp);
      RETURN NEW;
   END;
$example_table$ LANGUAGE plpgsql;

/* Create trigger 'employee_insert_trigger' */
CREATE TRIGGER example_trigger AFTER INSERT ON COMPANY
FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();

/* Insert values into 'Employees' */
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (1, 'Christopher', 32, 'Tenerife', 20000.00 );

/* Show all the elements of 'COMPANY' */
SELECT * FROM COMPANY;

/* Show all the elements of 'AUDIT' */
SELECT * FROM AUDIT;

/* Show all the triggers */
SELECT * FROM pg_trigger;
