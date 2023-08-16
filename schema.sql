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


 CREATE TABLE species(
vet_clinic(# id serial PRIMARY KEY,
vet_clinic(# name VARCHAR(255)
vet_clinic(# );
CREATE TABLE
vet_clinic=#
vet_clinic=# \d
               List of relations
 Schema |      Name      |   Type   |  Owner
--------+----------------+----------+----------
 public | animals        | table    | postgres
 public | animals_id_seq | sequence | postgres
 public | owners         | table    | postgres
 public | owners_id_seq  | sequence | postgres
 public | species        | table    | postgres
 public | species_id_seq | sequence | postgres
(6 rows)


vet_clinic=# ALTER TABLE animals
vet_clinic-# ADD COLUMN species_id INTEGER REFERENCES species(id),
vet_clinic-# ADD COLUMN owners_id INTEGER REFERENCES owners(id);
ALTER TABLE
vet_clinic=# SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species | species_id | owners_id
----+------------+---------------+-----------------+----------+-----------+---------+------------+-----------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon |            |
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon |            |
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon |            |
  6 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 | digimon |            |
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 | digimon |            |
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon |            |
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon |            |
  5 | Charmender | 2020-02-08    |               0 | f        |     11.00 | pokemon |            |
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon |            |
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon |            |
(10 rows)
