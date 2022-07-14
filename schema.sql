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

alter table animals add column species varchar; 
