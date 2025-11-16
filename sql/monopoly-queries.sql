--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT * 
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE email LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
ORDER BY score DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame, Game
  ;

--list of all games ordered by date with the most recent coming first
SELECT *
FROM Game
ORDER BY time DESC;

--all the games that occurred in the past week
SELECT *
FROM Game
WHERE time >= '2025-10-24 00:00:00'
  AND time < '2025-10-31 23:59:59';

--all players that have non null names
SELECT *
FROM Player
WHERE name IS NOT NULL;

--player IDs who have some game score greater than 1500 (none of my data meets 2000.00)
SELECT playerID
FROM PlayerGame
WHERE cash > 1500.00;

--all players with gmail accounts
SELECT *
FROM Player
WHERE emailAddress LIKE '%@gmail.edu';

--all of "The King's" game scores in decreasing order
SELECT cash
FROM PlayerGame, Player
WHERE Player.ID = PlayerGame.playerID
  AND Player.name = 'The King'
  ORDER BY cash DESC;

--winner of the game that was played on 2025-10-15 at 14:00:00
SELECT name
FROM Player, PlayerGame, Game
WHERE Player.ID = PlayerGame.playerID
    AND PlayerGame.gameID = Game.ID
    AND Game.time = '2025-10-15 14:00:00'
    ORDER BY PlayerGame.cash DESC
    LIMIT 1;
