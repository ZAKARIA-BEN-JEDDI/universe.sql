-- Create a table for planets
CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    diameter NUMERIC,
    distance_from_sun NUMERIC,
    orbital_period NUMERIC,
    has_moons BOOLEAN DEFAULT FALSE
);

-- Create a table for stars
CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    spectral_type VARCHAR(10),
    mass NUMERIC,
    luminosity NUMERIC
);

-- Create a table for moons
CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    planet_id INT REFERENCES planets(id),
    diameter NUMERIC,
    orbital_period NUMERIC
);

-- Create a table for galaxies
CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20),
    distance_from_earth NUMERIC
);

-- Insert sample data into planets
INSERT INTO planets (name, diameter, distance_from_sun, orbital_period, has_moons) VALUES
('Mercury', 4879, 57909175, 88, FALSE),
('Venus', 12104, 108208000, 225, FALSE),
('Earth', 12742, 149598262, 365.25, TRUE),
('Mars', 6779, 227943824, 687, TRUE);

-- Insert sample data into stars
INSERT INTO stars (name, spectral_type, mass, luminosity) VALUES
('Sun', 'G2V', 1.989e30, 1.0),
('Sirius', 'A1V', 2.0, 25.4);

-- Insert sample data into moons
INSERT INTO moons (name, planet_id, diameter, orbital_period) VALUES
('Moon', 3, 3475, 27.3),
('Phobos', 4, 22.4, 0.3),
('Deimos', 4, 12.4, 1.3);

-- Insert sample data into galaxies
INSERT INTO galaxies (name, type, distance_from_earth) VALUES
('Milky Way', 'Spiral', 0),
('Andromeda', 'Spiral', 2537000);
