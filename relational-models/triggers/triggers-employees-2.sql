/* Remove all the tables in 'public' schema */
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/* Remove all existing tables */
DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS EMPLOYEES_LOG;

/* Remove all existing triggers */
DROP TRIGGER test_trigger ON EMPLOYEES;

CREATE TABLE EMPLOYEES (
  id INT PRIMARY KEY NOT NULL,
  name text,
  age integer,
  designation text,
  salary integer
);

CREATE TABLE EMPLOYEES_LOG (
  id integer, 
  salary integer, 
  edittime TEXT NOT NULL
);

CREATE OR REPLACE FUNCTION test()
  RETURNS trigger AS
$$
BEGIN
  INSERT INTO EMPLOYEES_LOG(ID,SALARY, edittime)
  VALUES(NEW.ID, NEW.SALARY, current_date);
  RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER test_trigger
  AFTER INSERT
  ON EMPLOYEES
  FOR EACH ROW
  EXECUTE PROCEDURE test();

INSERT INTO EMPLOYEES (ID, NAME,AGE,DESIGNATION,SALARY) VALUES (1, 'Christopher', 32, 'Teacher', 20000.00);
INSERT INTO EMPLOYEES (ID, NAME,AGE,DESIGNATION,SALARY) VALUES (2, 'Isabel', 40, 'Teacher', 25000.00);
INSERT INTO EMPLOYEES (ID, NAME,AGE,DESIGNATION,SALARY) VALUES (3, 'Javier', 45, 'Teacher', 27000.00);

SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES_LOG;