/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
vet_clinic-# VALUES
vet_clinic-# ('Agumon', '2020-02-03', 0, true, 10.23),
vet_clinic-# ('Gabumon', '2018-11-15', 2, true, 8),
vet_clinic-# ('Pikachu', '2021-01-07', 1, false, 15.04),
vet_clinic-# ('Devimon', '2017-05-12', 5, true, 11);

-- Insert new Animals data
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
vet_clinic-# VALUES
vet_clinic-# ('Charmender', '2020-02-08', 0, false, -11, NULL),
vet_clinic-# ('Plantmon', '2021-11-15', 2, true, -5.7, NULL),
vet_clinic-# ('Squirtle', '1993-04-02', 3, false, -12.13, NULL),
vet_clinic-# ('Angemon', '2005-06-12', 1, true, -45, NULL),
vet_clinic-# ('Boarmon', '2005-06-07', 7, true, 20.4, NULL),
vet_clinic-# ('Blossom', '1998-10-13', 3, true, 17, NULL),
vet_clinic-# ('Ditto', '2022-05-14', 4, true, 22, NULL);

--Add new alter column in the animals table which is null
vet_clinic=# SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 |
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 |
  5 | Charmender | 2020-02-08    |               0 | f        |    -11.00 |
  6 | Plantmon   | 2021-11-15    |               2 | t        |     -5.70 |
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 |
  8 | Angemon    | 2005-06-12    |               1 | t        |    -45.00 |
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 |
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 |
 11 | Ditto      | 2022-05-14    |               4 | t        |     22.00 |


--After inserting the queries Select in the Species
SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmender | 2020-02-08    |               0 | f        |     11.00 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon
(10 rows)

 INSERT INTO owners (full_name, age)
vet_clinic-# VALUES
vet_clinic-# ('Sam Smith', 34),
vet_clinic-# ('Jennifer Orwell', 19),
vet_clinic-# ('Bob', 45),
vet_clinic-# ('Melody Pond', 77),
vet_clinic-# ('Dean Winchester', 14),
vet_clinic-# ('Jodie Whittaker', 38);
INSERT 0 6

 INSERT INTO species (name) VALUES
vet_clinic-# ('pokemon'),
vet_clinic-# ('digimon');
INSERT 0 2

 UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE 6
vet_clinic=# UPDATE animals SET species_id = 1 WHERE species_id = IS NULL;
ERROR:  syntax error at or near "NULL"
LINE 1: ...PDATE animals SET species_id = 1 WHERE species_id = IS NULL;
                                                                  ^
vet_clinic=# UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
UPDATE 4

 SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species | species_id | owners_id
----+------------+---------------+-----------------+----------+-----------+---------+------------+-----------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon |          2 |
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon |          2 |
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon |          2 |
  6 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 | digimon |          2 |
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 | digimon |          2 |
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon |          2 |
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon |          1 |
  5 | Charmender | 2020-02-08    |               0 | f        |     11.00 | pokemon |          1 |
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon |          1 |
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon |          1 |
(10 rows)

 UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
 UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
vet_clinic=# UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
 UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE 2
vet_clinic=# UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE 2
vet_clinic=# UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE 2
vet_clinic=# UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE 2
 UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
UPDATE 2

 SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species | species_id | owners_id
----+------------+---------------+-----------------+----------+-----------+---------+------------+-----------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon |          2 |         1
  4 | Devimon    | 2017-05-12    |               5 | t        |     11.00 | digimon |          2 |         3
  6 | Plantmon   | 2021-11-15    |               2 | t        |      5.70 | digimon |          2 |         3
  2 | Gabumon    | 2018-11-15    |               2 | t        |      8.00 | digimon |          2 |         2
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon |          1 |         2
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon |          1 |         4
 10 | Blossom    | 1998-10-13    |               3 | t        |     17.00 | pokemon |          1 |         4
  8 | Angemon    | 2005-06-12    |               1 | t        |     45.00 | digimon |          2 |         5
  9 | Boarmon    | 2005-06-07    |               7 | t        |     20.40 | digimon |          2 |         5
  5 | Charmender | 2020-02-08    |               0 | f        |     11.00 | pokemon |          1 |
(10 rows)
