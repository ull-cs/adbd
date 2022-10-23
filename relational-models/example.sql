/* 
 * Commands used to create 2 tables: Customers and Contacts
 * Usage: 
 *   sudo su postgres
 *   psql
 *   \i example.sql
 */

/* Remove all the tables in 'public' schema */
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/* Drop tables if exist */
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

/* Create table 'customers' */
CREATE TABLE customers(
  customer_id INT GENERATED ALWAYS AS IDENTITY,
  customer_name VARCHAR(255) NOT NULL,
  PRIMARY KEY(customer_id)
);

/* Create table 'contacts' */
CREATE TABLE contacts(
  contact_id INT GENERATED ALWAYS AS IDENTITY,
  customer_id INT,
  contact_name VARCHAR(255) NOT NULL,
  phone VARCHAR(17),
  email VARCHAR(100),
  PRIMARY KEY(contact_id),
  CONSTRAINT fk_customer
    FOREIGN KEY(customer_id) 
      REFERENCES customers(customer_id)
	    ON DELETE CASCADE
);

/* Insert customers */
INSERT INTO customers(customer_name)
VALUES
  ('Andrea'),
  ('Luis'),
  ('Manuel'),
  ('Sonia');

/* Insert contacts */
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES
  (1,'Antonio','(0034)-922-319191','antonio@ull.edu.es'),
  (1,'Nuria','(0034)-922-571083','nuria@ull.edu.es'),
  (2,'Yeray','(0034)-928-670579','yeray@ull.edu.es');

/* Select customers */
SELECT * FROM customers;

/* Select contacts */
SELECT * FROM contacts;

/* Delete a customer */
DELETE FROM customers
WHERE customer_id = 1;

/* Select customers */
SELECT * FROM customers;

/* Select contacts */
SELECT * FROM contacts;