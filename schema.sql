/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
vet_clinic(# id serial PRIMARY KEY,
vet_clinic(# name VARCHAR(255),
vet_clinic(# date_of_birth DATE,
vet_clinic(# escape_attempts INTEGER,
vet_clinic(# neutered BOOLEAN,
vet_clinic(# weight_kg DECIMAL(8, 2)
vet_clinic(# );

ALTER TABLE animals
vet_clinic-# ADD COLUMN species VARCHAR(255);
