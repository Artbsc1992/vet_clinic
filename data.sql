/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
('Agumon' , 'Feb 3, 2020' , 0, true, 10.23), 
('Gabumon', 'Nov 15, 2018', 2, true, 8.0), 
('Pikachu', 'Jan 7, 2021', 1, false, 15.04), 
('Devimon', 'May 12, 2017', 5, true, 11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
('Charmander' , 'Feb 8, 2020' , 0, false, -11.0), 
('Plantmon' , 'Nov 15, 2021' , 2, true, -5.70), 
('Squirtle' , 'Apr 2, 1993' , 3, false, -12.13), 
('Angemon' , 'Jun 12, 2005' , 1, true, -45.0), 
('Boarmon' , 'Jun 7, 2005' , 7, true, 20.40), 
('Blossom' , 'Oct 13, 1998' , 3, true, 17.0), 
('Ditto' , 'May 14, 2022' , 4, true, 22.0);

INSERT INTO owners (full_name, age) 
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES
('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, 'Apr 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-24' FROM animals, vets 
WHERE animals.name='Agumon' AND vets.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-07-22' FROM animals, vets 
WHERE animals.name='Agumon' AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-02-02' FROM animals, vets 
WHERE animals.name='Gabumon' AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-01-05' FROM animals, vets 
WHERE animals.name='Pikachu' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-03-08' FROM animals, vets 
WHERE animals.name='Pikachu' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-24' FROM animals, vets 
WHERE animals.name='Pikachu' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-05-04' FROM animals, vets 
WHERE animals.name='Devimon' AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-02-24' FROM animals, vets 
WHERE animals.name='Charmander' AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-12-21' FROM animals, vets 
WHERE animals.name='Plantmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-08-10' FROM animals, vets 
WHERE animals.name='Plantmon' AND vets.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-04-07' FROM animals, vets 
WHERE animals.name='Plantmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-09-29' FROM animals, vets 
WHERE animals.name='Squirtle' AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-10-03' FROM animals, vets 
WHERE animals.name='Angemon' AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-11-04' FROM animals, vets 
WHERE animals.name='Angemon' AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-01-24' FROM animals, vets 
WHERE animals.name='Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-05-15' FROM animals, vets 
WHERE animals.name='Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-02-27' FROM animals, vets 
WHERE animals.name='Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-08-03' FROM animals, vets 
WHERE animals.name='Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-24' FROM animals, vets 
WHERE animals.name='Blossom' AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-01-11' FROM animals, vets 
WHERE animals.name='Blossom' AND vets.name = 'William Tatcher';