--
-- Expanded Monopoly database schema for CS 262 Lab 7.
--
-- @author Hayden Stob
-- @version Fall, 2025
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperty;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	cash integer NOT NULL DEFAULT 1500,
    numProperties integer NOT NULL DEFAULT 0,
    currentPosition integer NOT NULL DEFAULT 0, -- index of board space
    turnNumber integer NOT NULL DEFAULT 0 -- number of turns taken up until this point in the game
	);

CREATE TABLE Property (
    ID              integer PRIMARY KEY,
    name            VARCHAR(50) NOT NULL,
    colorGroup      VARCHAR(20) NOT NULL,
    purchasePrice   integer,
    houseCost       integer,
    hotelCost       integer,
    rentBase        integer,
    rent1House      integer,
    rent2Houses     integer,
    rent3Houses     integer,
    rent4Houses     integer,
    rentHotel       integer
    );

CREATE TABLE PlayerProperty (
    gameID integer REFERENCES Game(ID),
    playerID integer REFERENCES Player(ID),
    propertyID integer REFERENCES Property(ID),
    houses integer NOT NULL DEFAULT 0,
    hotels integer NOT NULL DEFAULT 0
    );

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PlayerProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2025-10-26 19:00:00');
INSERT INTO Game VALUES (2, '2025-10-25 20:30:00');

INSERT INTO Player VALUES (1, 'hbs5@calvin.edu', 'Hadeens');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (1, 'Mediterranean Avenue', 'Brown', 60, 50, 50, 2, 10, 30, 90, 160, 250);
INSERT INTO Property VALUES (2, 'Baltic Avenue', 'Brown', 60, 50, 50, 4, 20, 60, 180, 320, 450);
INSERT INTO Property VALUES (3, 'Oriental Avenue', 'Light Blue', 100, 50, 50, 6, 30, 90, 270, 400, 550);
INSERT INTO Property VALUES (4, 'Vermont Avenue', 'Light Blue', 100, 50, 50, 6, 30, 90, 270, 400, 550);
INSERT INTO Property VALUES (5, 'Connecticut Avenue', 'Light Blue', 120, 50, 50, 8, 40, 100, 300, 450, 600);
INSERT INTO Property VALUES (6, 'St. Charles Place', 'Pink', 140, 100, 100, 10, 50, 150, 450, 625, 750);
INSERT INTO Property VALUES (7, 'States Avenue', 'Pink', 140, 100, 100, 10, 50, 150, 450, 625, 750);
INSERT INTO Property VALUES (8, 'Virginia Avenue', 'Pink', 160, 100, 100, 12, 60, 180, 500, 700, 900);
INSERT INTO Property VALUES (9, 'St. James Place', 'Orange', 180, 100, 100, 14, 70, 200, 550, 750, 950);
INSERT INTO Property VALUES (10, 'Tennessee Avenue', 'Orange', 180, 100, 100, 14, 70, 200, 550, 750, 950);
INSERT INTO Property VALUES (11, 'New York Avenue', 'Orange', 200, 100, 100, 16, 80, 220, 600, 800, 1000);
INSERT INTO Property VALUES (12, 'Kentucky Avenue', 'Red', 220, 150, 150, 18, 90, 250, 700, 875, 1050);
INSERT INTO Property VALUES (13, 'Indiana Avenue', 'Red', 220, 150, 150, 18, 90, 250, 700, 875, 1050);
INSERT INTO Property VALUES (14, 'Illinois Avenue', 'Red', 240, 150, 150, 20, 100, 300, 750, 925, 1100);
INSERT INTO Property VALUES (15, 'Atlantic Avenue', 'Yellow', 260, 150, 150, 22, 110, 330, 800, 975, 1150);
INSERT INTO Property VALUES (16, 'Ventnor Avenue', 'Yellow', 260, 150, 150, 22, 110, 330, 800, 975, 1150);
INSERT INTO Property VALUES (17, 'Marvin Gardens', 'Yellow', 280, 150, 150, 24, 120, 360, 850, 1025, 1200);
INSERT INTO Property VALUES (18, 'Pacific Avenue', 'Green', 300, 200, 200, 26, 130, 390, 900, 1100, 1275);
INSERT INTO Property VALUES (19, 'North Carolina Avenue', 'Green', 300, 200, 200, 26, 130, 390, 900, 1100, 1275);
INSERT INTO Property VALUES (20, 'Pennsylvania Avenue', 'Green', 320, 200, 200, 28, 150, 450, 1000, 1200, 1400);
INSERT INTO Property VALUES (21, 'Park Place', 'Dark Blue', 350, 200, 200, 35, 175, 500, 1100, 1300, 1500);
INSERT INTO Property VALUES (22, 'Boardwalk', 'Dark Blue', 400, 200, 200, 50, 200, 600, 1400, 1700, 2000);

INSERT INTO PlayerGame VALUES (1, 1, 1250.00, 1, 19, 5);
INSERT INTO PlayerGame VALUES (1, 2, 1500.00, 0, 12, 5);
INSERT INTO PlayerGame VALUES (1, 3, 800.00, 2, 8, 4);
INSERT INTO PlayerGame VALUES (2, 2, 1300.00, 1, 22, 6);
INSERT INTO PlayerGame VALUES (2, 3, 1450.00, 0, 5, 6);
INSERT INTO PlayerGame VALUES (2, 1, 1600.00, 0, 3, 6);

INSERT INTO PlayerProperty VALUES (1, 1, 4, 0, 0);
INSERT INTO PlayerProperty VALUES (1, 3, 1, 0, 0);
INSERT INTO PlayerProperty VALUES (2, 3, 2, 1, 0);
INSERT INTO PlayerProperty VALUES (2, 2, 22, 0, 0);
INSERT INTO PlayerProperty VALUES (2, 3, 5, 2, 0);

--adding more rows to Game and PlayerGame tables for query examples
INSERT INTO Game VALUES (3, '2025-10-15 14:00:00');
INSERT INTO Game VALUES (4, '2025-11-20 18:30:00');
INSERT INTO Game VALUES (5, '2025-09-05 20:00:00');

INSERT INTO PlayerGame Values (3, 1, 1200.00, 5, 18, 20);
INSERT INTO PlayerGame Values (3, 2, 1500.00, 7, 22, 25);
INSERT INTO PlayerGame Values (3, 3, 1300.00, 6, 19, 21);

INSERT INTO PlayerGame Values (4, 1, 1600.00, 8, 24, 27);
INSERT INTO PlayerGame Values (4, 2, 1400.00, 5, 20, 23);
INSERT INTO PlayerGame Values (4, 3, 1700.00, 9, 26, 30);

INSERT INTO PlayerGame Values (5, 1, 1100.00, 4, 15, 18);
INSERT INTO PlayerGame Values (5, 2, 1250.00, 6, 18, 20);
INSERT INTO PlayerGame Values (5, 3, 1350.00, 7, 21, 22);