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

SELECT vets.name, animals.name, visits.date_of_visit
FROM visits
INNER JOIN animals ON (animals.id = visits.animal_id)
INNER JOIN vets ON (vets.id = visits.vet_id)
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT vets.name, count(distinct visits.animal_id)
FROM visits
INNER JOIN animals ON (animals.id = visits.animal_id)
INNER JOIN vets ON (vets.id = visits.vet_id)
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

SELECT vets.*, species.name as specialty
FROM vets
LEFT OUTER JOIN specializations ON (specializations.vet_id = vets.id)
LEFT JOIN species ON (species.id = specializations.species_id)
;

SELECT vets.name, animals.*, visits.date_of_visit
FROM visits
INNER JOIN animals ON (animals.id = visits.animal_id)
INNER JOIN vets ON (vets.id = visits.vet_id)
WHERE vets.name = 'Stephanie Mendez'
 and visits.date_of_visit between '2020-04-01' and '2020-08-30'
GROUP BY vets.name, animals.id, visits.date_of_visit
;

SELECT animals.*, count(visits.date_of_visit) as visits_to_vet
FROM visits
INNER JOIN animals ON (animals.id = visits.animal_id)
GROUP BY animals.id
ORDER BY count(visits.date_of_visit) DESC
LIMIT 1;

SELECT animals.*, vets.*, visits.date_of_visit
FROM visits
INNER JOIN animals ON (animals.id = visits.animal_id)
INNER JOIN vets ON (vets.id = visits.vet_id)
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC
LIMIT 1;

SELECT count(*) as visits_not_to_specialist
FROM visits
INNER JOIN vets AS vetid ON (vetid.id = visits.vet_id)
INNER JOIN animals ON (animals.id = visits.animal_id)
WHERE animals.species_id NOT IN (
   SELECT coalesce(specializations.species_id,0)
   FROM vets
   LEFT OUTER JOIN specializations ON (specializations.vet_id = vets.id)
   WHERE vets.id = visits.vet_id
);

SELECT vets.name, species.name as specialty, count(animals.species_id)
FROM visits
INNER JOIN vets ON (vets.id = visits.vet_id)
INNER JOIN animals ON (animals.id = visits.animal_id)
INNER JOIN species ON (species.id = animals.species_id)
WHERE vets.name = 'Maisy Smith'
GROUP by vets.name, species.name
ORDER BY count(animals.species_id) desc
LIMIT 1;


explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;

explain analyze SELECT * FROM visits where vet_id = 2;

explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

