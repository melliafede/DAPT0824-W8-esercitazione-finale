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
    CodiceDocumento CHAR(10),
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


INSERT INTO Sales (CodiceDocumento, Date, ProductID, RegionID) VALUES
('DOC000001', '2024-04-15', 5, 2),
('DOC000002', '2024-06-20', 12, 4),
('DOC000003', '2024-03-05', 20, 1),
('DOC000004', '2024-09-10', 7, 5),
('DOC000005', '2024-11-25', 25, 8),
('DOC000006', '2024-07-02', 3, 6),
('DOC000007', '2024-05-17', 17, 3),
('DOC000008', '2024-12-30', 10, 7),
('DOC000009', '2024-10-09', 29, 4),
('DOC000010', '2024-08-14', 14, 1),
('DOC000011', '2024-02-28', 8, 2),
('DOC000012', '2024-07-21', 23, 5),
('DOC000013', '2024-04-11', 2, 6),
('DOC000014', '2024-06-06', 30, 3),
('DOC000015', '2024-03-19', 9, 7),
('DOC000016', '2024-09-23', 6, 8),
('DOC000017', '2024-10-12', 16, 4),
('DOC000018', '2024-05-31', 11, 1),
('DOC000019', '2024-12-07', 21, 2),
('DOC000020', '2024-11-15', 27, 5),
('DOC000021', '2024-03-28', 5, 3),
('DOC000022', '2024-08-09', 12, 7),
('DOC000023', '2024-06-15', 20, 6),
('DOC000024', '2024-07-27', 7, 4),
('DOC000025', '2024-05-05', 25, 2),
('DOC000026', '2024-10-21', 3, 1),
('DOC000027', '2024-09-07', 17, 8),
('DOC000028', '2024-12-05', 10, 3),
('DOC000029', '2024-04-30', 29, 5),
('DOC000030', '2024-02-23', 14, 6),
('DOC000031', '2024-06-09', 8, 7),
('DOC000032', '2024-11-30', 23, 2),
('DOC000033', '2024-09-02', 2, 4),
('DOC000034', '2024-03-11', 30, 8),
('DOC000035', '2024-12-19', 9, 1),
('DOC000036', '2024-07-14', 6, 5),
('DOC000037', '2024-08-28', 16, 2),
('DOC000038', '2024-04-07', 11, 3),
('DOC000039', '2024-10-17', 21, 6),
('DOC000040', '2024-05-24', 27, 7),
('DOC000041', '2024-03-15', 5, 1),
('DOC000042', '2024-09-25', 5, 4),
('DOC000043', '2024-12-10', 12, 6),
('DOC000044', '2024-02-18', 12, 8),
('DOC000045', '2024-10-05', 20, 3),
('DOC000046', '2024-11-11', 20, 2),
('DOC000047', '2024-06-01', 7, 5),
('DOC000048', '2024-08-20', 7, 7),
('DOC000049', '2024-07-18', 25, 1),
('DOC000050', '2024-09-29', 25, 3),
('DOC000051', '2024-04-08', 3, 2),
('DOC000052', '2024-05-22', 3, 4),
('DOC000053', '2024-07-05', 3, 7),
('DOC000054', '2024-10-16', 16, 5),
('DOC000055', '2024-12-01', 16, 8),
('DOC000056', '2024-09-14', 27, 2),
('DOC000057', '2024-06-30', 27, 6),
('DOC000058', '2024-08-25', 27, 8);
