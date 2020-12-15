-- Team with most wins in NHL History
SELECT t.short_name, COUNT(t.team_id)
FROM game_team_info AS g 
LEFT JOIN team_info AS t
ON t.team_id = g.team_id
WHERE g.won = 'true'
GROUP BY t.short_name
ORDER BY COUNT(t.team_id) DESC;

--Players with most goals in NHL Data Set
SELECT p.player_id, p.first_name, p.last_name, SUM(g.goals)
FROM game_skater_info AS g
LEFT JOIN player_info AS p
ON p.player_id = g.player_id
WHERE g.goals > 0
GROUP BY p.player_id
ORDER BY SUM(g.goals) DESC;

--Goalies with most total saves in the database
SELECT p.player_id, p.first_name, p.last_name, p.primary_position, SUM(g.saves)
FROM player_info AS p
LEFT JOIN goalie_info AS g
ON g.player_id = p.player_id
WHERE p.primary_position = 'G' AND g.saves >= 1
GROUP BY p.player_id
ORDER BY SUM(g.saves) DESC;


--goalies with most wins in database
SELECT p.player_id, p.first_name, p.last_name, p.primary_position, COUNT(g.decision)
FROM player_info AS p
LEFT JOIN goalie_info AS g
ON g.player_id = p.player_id
WHERE p.primary_position = 'G' and g.decision = 'W'
GROUP BY p.player_id
ORDER BY COUNT(g.decision) DESC;

--Teams with the most penalty mins
SELECT t.team_id, t.short_name, t.team_name, SUM(g.pim)
FROM team_info as t
LEFT JOIN game_team_info as g
ON g.team_id = t.team_id
GROUP BY t.team_id
ORDER BY SUM(g.pim) DESC;


--Most playoff wins by team
SELECT t.team_id, t.short_name, t.team_name, COUNT(gi.won)
FROM team_info AS t
LEFT JOIN game_team_info as gi
ON gi.team_id = t.team_id
LEFT JOIN game_info as g
ON g.game_id = gi.game_id 
WHERE gi.won = 'true' AND g.game_type = 'P'
GROUP BY t.team_id
ORDER BY COUNT(gi.won) DESC;
