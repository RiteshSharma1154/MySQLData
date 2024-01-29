--Create tables with unique variables and primary keys

---Create Table : City
CREATE TABLE city(
	id int NOT NULL IDENTITY(1, 1),
	city_name char(128) NOT NULL,
	lat decimal(9, 6) NOT NULL,
	long decimal(9, 6) NOT NULL,
	country_id int NOT NULL,
	CONSTRAINT city_pk PRIMARY KEY(id)
);

---Create Table : Country
CREATE TABLE country(
	id int NOT NULL IDENTITY(1, 1),
	country_name char(128) NOT NULL,
	country_name_eng char(128) NOT NULL,
	country_code char(8) NOT NULL,
	CONSTRAINT country_ak_1 UNIQUE (country_name),
	CONSTRAINT country_ak_2 UNIQUE (country_name_eng),
	CONSTRAINT country_ak_3 UNIQUE (country_code),
	CONSTRAINT country_pk PRIMARY KEY (id)
);

--Create foreign keys in a table
ALTER TABLE city ADD CONSTRAINT city_country
	FOREIGN KEY (country_id)
	REFERENCES country (id);

--Insert values in Table : country
INSERT INTO country (country_name, country_name_eng, country_code) VALUES ('Deutchsland', 'Germany', 'DEU');
INSERT INTO country (country_name, country_name_eng, country_code) VALUES ('Srbija', 'Serbia', 'SRB');
INSERT INTO country (country_name, country_name_eng, country_code) VALUES ('Hrvatska', 'Croatia', 'HRV');
INSERT INTO country (country_name, country_name_eng, country_code) VALUES ('United Stated of America', 'United Stated of America', 'USA');
INSERT INTO country (country_name, country_name_eng, country_code) VALUES ('Polska', 'Poland', 'POL');

--Show the top X columns
SELECT TOP 3 * FROM country;
SELECT * FROM country;

---Insert values in Table : city
INSERT INTO city (city_name, lat, long, country_id) VALUES ('Berlin', '52.520008', '13.404954','DEU' );




