-- Creazione database per gestire le vendite di ToysGroup
CREATE DATABASE ToysGroup;

-- Selezione del database da utilizzare
USE ToysGroup;

-- Creazione tabella Categorie
CREATE TABLE Category (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Creazione tabella Prodotti
CREATE TABLE Product (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Weight DECIMAL(5,2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

-- Creazione tabella Regioni di vendita
CREATE TABLE Region (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Creazione tabella Stati
CREATE TABLE State (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(ID)
);
    

-- Creazione tabella Vendite
CREATE TABLE Sales (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    ProductID INT,
    RegionID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ID),
    FOREIGN KEY (RegionID) REFERENCES Region(ID)
);


-- Popolazione tabelle
INSERT INTO Category (Name) VALUES
('Dolls'),
('Building Blocks'),
('Vehicles'),
('Educational Toys'),
('Stuffed Animals'),
('Musical Toys'),
('Outdoor Toys'),
('Train Sets'),
('Video Games'),
('Board Games');

INSERT INTO Product (Name, Weight, CategoryID) VALUES
('Barbie Doll', 0.25, 1),
('Action Figure', 0.35, 1),
('Lego Set', 1.50, 2),
('Wooden Blocks', 2.00, 2),
('Race Car Set', 0.80, 3),
('Truck Toy', 1.10, 3),
('Learning Puzzle', 0.30, 4),
('Alphabet Blocks', 0.45, 4),
('Teddy Bear', 0.90, 5),
('Plush Elephant', 1.20, 5),
('Musical Keyboard', 2.50, 6),
('Toy Drum', 1.60, 6),
('Soccer Ball', 0.45, 7),
('Frisbee', 0.25, 7),
('Train Set', 2.70, 8),
('Toy Locomotive', 1.80, 8),
('Super Mario Game', 0.10, 9),
('FIFA Soccer Game', 0.15, 9),
('Monopoly', 1.00, 10),
('Scrabble', 0.90, 10),
('Baby Doll Set', 0.50, 1),
('Construction Vehicle', 1.30, 3),
('Robotic Arm Toy', 2.00, 2),
('Stacking Cups', 0.20, 4),
('Stuffed Dog', 1.00, 5),
('Musical Toy Xylophone', 1.20, 6),
('Jump Rope', 0.40, 7),
('Toy Airplane', 0.60, 3),
('Interactive Toy Robot', 1.80, 4),
('Board Game Chess', 0.80, 10),
('Outdoor Playset', 3.50, 7);

INSERT INTO Region (Name) VALUES
('North America'),
('Europe'),
('Asia'),
('South America'),
('Africa'),
('Oceania'),
('Middle East'),
('Central America');

INSERT INTO State (Name, RegionID) VALUES
('United States', 1),  -- North America
('Canada', 2),         -- Europe
('Germany', 2),        -- Europe
('China', 3),          -- Asia
('Japan', 3),          -- Asia
('Argentina', 4),      -- South America
('Brazil', 4),         -- South America
('Egypt', 5),          -- Africa
('Nigeria', 5),        -- Africa
('Australia', 6),      -- Oceania
('New Zealand', 6),    -- Oceania
('United Arab Emirates', 7), -- Middle East
('Qatar', 7),          -- Middle East
('Mexico', 8);         -- Central America


INSERT INTO Sales (Date, ProductID, RegionID) VALUES
('2025-02-01', 1, 1),   -- Barbie Doll, North America
('2025-02-02', 2, 2),   -- Action Figure, Europe
('2025-02-03', 3, 3),   -- Lego Set, Asia
('2025-02-04', 4, 4),   -- Wooden Blocks, South America
('2025-02-05', 5, 5),   -- Race Car Set, Africa
('2025-02-06', 6, 6),   -- Truck Toy, Oceania
('2025-02-07', 7, 7),   -- Learning Puzzle, Middle East
('2025-02-08', 8, 8),   -- Alphabet Blocks, Central America
('2025-02-09', 9, 1),   -- Teddy Bear, North America
('2025-02-10', 10, 2),  -- Plush Elephant, Europe
('2025-02-11', 11, 3),  -- Musical Keyboard, Asia
('2025-02-12', 12, 4),  -- Toy Drum, South America
('2025-02-13', 13, 5),  -- Soccer Ball, Africa
('2025-02-14', 14, 6),  -- Frisbee, Oceania
('2025-02-15', 15, 7),  -- Train Set, Middle East
('2025-02-16', 16, 8),  -- Toy Locomotive, Central America
('2025-02-17', 17, 1),  -- Super Mario Game, North America
('2025-02-18', 18, 2),  -- FIFA Soccer Game, Europe
('2025-02-19', 19, 3),  -- Monopoly, Asia
('2025-02-20', 20, 4),  -- Scrabble, South America
('2025-02-21', 21, 5),  -- Baby Doll Set, Africa
('2025-02-22', 22, 6),  -- Construction Vehicle, Oceania
('2025-02-23', 23, 7),  -- Robotic Arm Toy, Middle East
('2025-02-24', 24, 8),  -- Stacking Cups, Central America
('2025-02-25', 25, 1),  -- Stuffed Dog, North America
('2025-02-26', 26, 2),  -- Musical Toy Xylophone, Europe
('2025-02-27', 27, 3),  -- Jump Rope, Asia
('2025-02-28', 28, 4),  -- Toy Airplane, South America
('2025-03-01', 29, 5),  -- Interactive Toy Robot, Africa
('2025-03-02', 30, 6);  -- Board Game Chess, Oceania



