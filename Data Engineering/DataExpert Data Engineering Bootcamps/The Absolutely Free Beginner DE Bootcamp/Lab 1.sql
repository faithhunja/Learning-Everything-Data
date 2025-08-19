-- Create two Common Table Expressions (CTE); deduped_details and deduped_games
WITH deduped_details AS (
    /**
    -- Define deduped_details CTE
    -- We find MAX(pts) in case a player's stats were accidentally entered more 
       than once for the same game
    **/
    SELECT player_name, game_id, MAX(pts) as pts FROM bootcamp.nba_game_details
    -- Grouping by player_name and game_id to get one entry per player per game
    GROUP BY player_name, game_id
), deduped_games AS (
    -- Define deduped_games CTE
    -- Select every game's game_id, season and game_date_est
    SELECT DISTINCT game_id, season, game_date_est FROM bootcamp.nba_games
    /**
    -- Return games that happened before 15th April (regular season, not playoffs)
    -- season represents the year, Eg. 2023. But the 2023 season ends in 2024, so 
       we need the next year to find the right season end date of 15th April, 
       hence (season + 1) = 2024
    -- CAST((season + 1) AS VARCHAR) casts 2024 as VARCHAR resulting in '2024'
    -- || to concatenate. For example, '2024' || '-04-15' = '2024-04-15'
    -- DATE() function converts the VARCHAR '2024-04-15' into DATE data type
    **/
    WHERE game_date_est < DATE(CAST((season + 1) AS VARCHAR) || '-04-15')
)
-- Define the main query, which selects from the CTEs above
SELECT games.season, 
       details.player_name,
       SUM(details.pts) as total_pts,
       COUNT(*) as num_games,
       -- Gather a list of all unique dates
       ARRAY_AGG(DISTINCT games.game_date_est)
-- Use the CTEs we created before; deduped_details and deduped_games
FROM deduped_details as details
-- Join both tables on the game_id column
JOIN deduped_games as games ON details.game_id = games.game_id
/** games.season and details.player_name have to be included in the GROUP BY clause
    because they are in the SELECT statement but they are not aggregated columns **/
GROUP BY games.season, details.player_name