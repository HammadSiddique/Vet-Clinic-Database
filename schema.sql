/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;


CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

alter table animals add column species varchar(100); 

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name varchar(100),
    age INT
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100)
);

alter table animals add PRIMARY KEY (id);
alter table animals drop column species;
alter table animals add species_id INT REFERENCES species(id);
alter table animals add owner_id INT REFERENCES owners(id);

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations(
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id)
);

CREATE TABLE visits(
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    date_of_visit DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Created indexes for the columns to improve execution time
CREATE INDEX animal_ids ON visits(animal_id);
CREATE INDEX vets_ids ON visits(vet_id);
CREATE INDEX owner_emails ON owners(email);