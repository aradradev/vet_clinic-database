/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(8, 2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);


 CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species (
    id serial PRIMARY KEY,
    name VARCHAR(255)
);


ALTER TABLE animals
 ADD COLUMN species_id INTEGER REFERENCES species(id),
 ADD COLUMN owners_id INTEGER REFERENCES owners(id);