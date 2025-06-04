-- Active: 1748417776493@@127.0.0.1@5432@conservation_db
CREATE DATABASE conservation_db

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name  VARCHAR(50) NOT NULL,
    region  VARCHAR(50) NOT NULL
);

INSERT INTO rangers (name, region ) VALUES 
('Alice Green','Northern Hills' ),
('Bob White','River Delta '),
('Carol King', 'Mountain Range')

SELECT * FROM rangers;



CREATE TABLE species (
    species_id SERIAL PRIMARY key,
    common_name VARCHAR(50) NOT NULL ,
    scientific_name  VARCHAR(40) NOT NULL,
    discovery_date  DATE NOT NULL,
    conservation_status VARCHAR(50) CHECK(conservation_status in ('Endangered' , 'Vulnerable' , 'Historic'))
);

INSERT INTO species (common_name, scientific_name , discovery_date, conservation_status) VALUES 
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * FROM species;

create Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time  TIMESTAMP NOT NULL,
    location  VARCHAR(120) NOT NULL,
    notes TEXT
);

INSERT INTO sightings (ranger_id,species_id,location,sighting_time,notes) VALUES 
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM sightings;



-- insert rangers 
SELECT * FROM rangers;

INSERT INTO rangers (name, region) VALUES
('Derek Fox' , 'Coastal Plains');

DROP TABLE rangers;

DROP TABLE sightings

DROP Table species;

-- count table 

SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


-- search location pass 

SELECT * FROM sightings WHERE LOCATION ILIKE '%Pass%';

-- total sightings 

SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name;


-- List species that have never been sighted.


SELECT s.common_name
FROM species s
LEFT JOIN sightings si ON s.species_id = si.species_id
WHERE si.species_id IS NULL;


SELECT 
    sp.common_name, 
    si.sighting_time, 
    r.name
FROM sightings si
JOIN species sp ON si.species_id = sp.species_id
JOIN rangers r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;


-- update  

UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

SELECT * FROM species;


-- morning afternoon evening  

SELECT 
    sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id
    FROM sightings
);



