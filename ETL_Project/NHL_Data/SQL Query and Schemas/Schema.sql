CREATE TABLE game_info (
	game_id INT PRIMARY KEY,
	season INT,
	game_type VARCHAR,
	away_team_id INT,
	home_team_id INT,
	outcome VARCHAR(50)
	
);

CREATE TABLE team_info (
	team_id INT PRIMARY KEY,
	franchise_id INT,
	short_name VARCHAR,
	team_name VARCHAR
);

CREATE TABLE player_info (
	player_id INT PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	nationality VARCHAR,
	primary_position VARCHAR
);

CREATE TABLE goalie_info (
	game_id INT,
	player_id INT,
	team_id INT,
	shots INT,
	saves INT,
	decision VARCHAR
	
);

CREATE TABLE penalty_info (
	play_id VARCHAR PRIMARY KEY,
	penalty_severity VARCHAR,
	penalty_mins INT
);

CREATE TABLE game_play_info (
	play_id VARCHAR,
	game_id INT,
	event_type VARCHAR
);


CREATE TABLE game_skater_info (
	game_id INT,
	player_id INT,
	team_id INT,
	assists INT,
	goals INT,
	shots INT,
	penalty_mins INT	
);

CREATE TABLE game_team_info (
	game_id INT,
	team_id INT,
	home_or_away VARCHAR,
	won BOOLEAN DEFAULT false,
	goals INT,
	shots INT,
	hits INT,
	pim INT
);


DROP TABLE game_play_info;