/* 
 * Usage: 
 *   docker run -d --rm --name postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres
 *   docker run -it --rm --link postgres:postgres postgres psql -h postgres -U postgres
 *     - Password for user postgres: mysecretpassword
 */

/* Remove all the tables in 'public' schema */
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/* Drop tables if exist */
DROP TABLE IF EXISTS Airport;
DROP TABLE IF EXISTS Employee;

CREATE TYPE Name_t AS (
  lname VARCHAR(20),
  fname VARCHAR(20),
  initials VARCHAR(5)
);

CREATE TYPE Address_t AS (
  address1 VARCHAR(20),
  address2 VARCHAR(20),
  city VARCHAR(20),
  postcode VARCHAR(10),
  country VARCHAR(20)
);

CREATE TYPE Phone_t AS (
  init_code VARCHAR(5),
  local_code VARCHAR(10),
  num VARCHAR(10)
);

CREATE TYPE Contact_t AS (
  tel1 Phone_t,
  tel2 Phone_t,
  fax Phone_t,
  mobile Phone_t
);



CREATE TABLE Airport (
  code NUMERIC(4) PRIMARY KEY,
  name VARCHAR(10),
  contact Contact_t,
  address Address_t
);

CREATE TABLE Employee (
  nino NUMERIC(4) PRIMARY KEY,
  name Name_t,
  address Address_t,
  contact Contact_t,
  worksFor NUMERIC(4) REFERENCES Airport(code)
);



INSERT INTO Airport(code, name, contact, address) VALUES (
  1234, 
  'Los Rodeos', 
  (
    (+0034, 922, 123456), 
    (+0034, 922, 456789), 
    (+0034, 922, 789654), 
    (+0034, 922, 753159)
  ),
  (
    'La Laguna',
    'Sin número', 
    'La Laguna',
    39213, 
    'España'
  )
);

SELECT * FROM Airport;