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

select name from animals JOIN owners ON owners.full_name = 'Melody Pond' AND owners.id = animals.owner_id;
select * from animals JOIN species ON species.name = 'Pokemon' AND species.id = animals.species_id;
select name, full_name from animals RIGHT OUTER JOIN owners ON animals.owner_id = owners.id;
select count(*), species.name from animals JOIN species ON animals.species_id = species.id group by species.id;

select animals.name, owners.full_name as owner, species.name as type, animals.species_id from animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
where species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell'; 

select animals.name, animals.escape_attempts, owners.full_name as owner from animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

select count(*), owners.full_name as owner from animals
JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY count(*) DESC LIMIT 1;