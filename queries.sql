/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select * from animals where date_of_birth BETWEEN '2016-1-1' AND '2019-12-31';
select * from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' OR name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
select name, species FROM animals;
ROLLBACK;
select name, species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
select name, species FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
select * from animals;
ROLLBACK;
select * from animals;

BEGIN;
DELETE from animals WHERE date_of_birth > '01-01-2022';
select name, date_of_birth from animals;
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
select name, weight_kg from animals;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
select name, weight_kg from animals;
COMMIT;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select AVG(weight_kg) from animals;
select count(escape_attempts) as escape_counts, neutered from animals group by neutered;
select MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight, species from animals group by species;
select AVG(escape_attempts) as avg_escape_attempt, species from animals where date_of_birth between '01-01-1990' and '12-31-2000' group by species;