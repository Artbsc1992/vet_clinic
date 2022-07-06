/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '1/1/2016' AND '31/12/2019';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT *  FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, Min(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species; 
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01/01/1990' AND '31/12/2000' GROUP BY species;

SELECT name, full_name
FROM animals JOIN owners 
ON animals.owner_id = owners.id
WHERE owners.full_name LIKE 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species 
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT *
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT count(*), species.name
FROM species JOIN animals
ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name, owners.full_name
FROM animals JOIN owners 
ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name, owners.full_name
FROM animals JOIN owners 
ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT COUNT(*) AS animals_count, owners.full_name
FROM animals JOIN owners 
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animals_count DESC;
