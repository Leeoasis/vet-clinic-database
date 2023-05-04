/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
	(1,'Agumon', TO_DATE('03/02/2020', 'MM/DD/YYYY'), 0, true, 10.23),
	(2,'Gabumon', TO_DATE('11/15/2020', 'MM/DD/YYYY'), 2, true, 8),
	(3,'Pikachu', TO_DATE('01/07/2021', 'MM/DD/YYYY'), 1, false, 15.04),
	(4,'Devimon', TO_DATE('05/12/2017', 'MM/DD/YYYY'), 5, true, 11)

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
		(5,'Charmander', TO_DATE('02/08/2020', 'MM/DD/YYYY'), 0, false, -11),
		(6,'Plantmon', TO_DATE('11/15/2021', 'MM/DD/YYYY'), 2, true, -5.7),
		(7,'Squirtle', TO_DATE('04/02/1993', 'MM/DD/YYYY'), 3, false, -12.13),
		(8,'Angemon', TO_DATE('06/12/2005', 'MM/DD/YYYY'), 1, true, -45),
		(9,'Boarmon', TO_DATE('06/07/2005', 'MM/DD/YYYY'), 7, true, 20.4),
		(10,'Blossom', TO_DATE('10/13/1998', 'MM/DD/YYYY'), 3, true, 17),
		(11,'Ditto', TO_DATE('05/14/2022', 'MM/DD/YYYY'), 4, true, -22)

--Inserting data in the owners table

INSERT INTO owners (full_name, age)
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Inserting data in the owners table

INSERT INTO species (name)
VALUES 
('Pokemon'),
('Digimon');

-- Inserting species_id in animals table

UPDATE animals 
SET species_id = 
  CASE 
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END;

--Modify your inserted animals to include owner information

UPDATE animals 
SET owner_id = 
  CASE 
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  END;
  