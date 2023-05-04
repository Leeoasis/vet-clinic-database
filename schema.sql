/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL,
);


ALTER TABLE animals
ADD species VARCHAR(255);

.

/* Create a table named owners */

CREATE TABLE owners (
   id SERIAL PRIMARY KEY,
   full_name varchar(255) NOT NULL,
   age int NOT NULL
);

/* Create a table named species */
CREATE TABLE species (
   id SERIAL PRIMARY KEY,
   name varchar(255) NOT NULL
);

/* Modify animals table */










