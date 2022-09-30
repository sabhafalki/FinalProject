-- Database: Raptors

-- DROP DATABASE IF EXISTS "Raptors";

CREATE DATABASE "Raptors"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Creating TEAMS TABLE for Raptors
CREATE TABLE Teams (
     TeamID VARCHAR(3) NOT NULL,
     TeamName VARCHAR(40) NOT NULL,
     PRIMARY KEY (TeamID),
     UNIQUE (TeamName)
);

-- -- Creating PLAYERS TABLE for Raptors
CREATE TABLE Players (
     PlayerID VARCHAR(10) NOT NULL,
     PlayerName VARCHAR(40) NOT NULL,
     PRIMARY KEY (PlayerID),
     UNIQUE (PlayerName)
);

-- Creating REGULAR MATCHES TABLE for Raptors
DROP TABLE IF EXISTS public.regulars;
CREATE TABLE Regulars (
	 matchID VARCHAR(10) NOT NULL,
     date DATE NOT NULL,
	 matchup VARCHAR NOT NULL,
	 matchtype VARCHAR NOT NULL,
	 w_l VARCHAR NOT NULL,
	 minutes INT NOT NULL,
	 points INT NOT NULL,
	 FGM INT NOT NULL,
	 FGA INT NOT NULL,
	 FGpercentage FLOAT,
	 _3PM INT NOT NULL,
	 _3PA INT NOT NULL,
	 _3Ppercentage FLOAT,
	 FTM INT NOT NULL,
	 FTA INT NOT NULL,
	 FTpercentage FLOAT, 
	 OREB INT NOT NULL,
	 DREB INT NOT NULL,
	 REB INT NOT NULL, 
	 AST INT NOT NULL,
	 STL INT NOT NULL,
	 BLK INT NOT NULL,
	 TOV INT NOT NULL,
	 PF INT NOT NULL,
	 scorediff INT NOT NULL,
     PRIMARY KEY (matchID),
     UNIQUE (matchID),
	 FOREIGN KEY (matchup) REFERENCES teams (TeamID)
);

-- Creating Playoffs MATCHES TABLE for Raptors
DROP TABLE IF EXISTS public.playoffs;
CREATE TABLE Playoffs (
	 matchID VARCHAR(10) NOT NULL,
     date DATE NOT NULL,
	 matchup VARCHAR NOT NULL,
	 matchtype VARCHAR NOT NULL,
	 w_l VARCHAR NOT NULL,
	 minutes INT NOT NULL,
	 points INT NOT NULL,
	 FGM INT NOT NULL,
	 FGA INT NOT NULL,
	 FGpercentage FLOAT,
	 _3PM INT NOT NULL,
	 _3PA INT NOT NULL,
	 _3Ppercentage FLOAT,
	 FTM INT NOT NULL,
	 FTA INT NOT NULL,
	 FTpercentage FLOAT, 
	 OREB INT NOT NULL,
	 DREB INT NOT NULL,
	 REB INT NOT NULL, 
	 AST INT NOT NULL,
	 STL INT NOT NULL,
	 BLK INT NOT NULL,
	 TOV INT NOT NULL,
	 PF INT NOT NULL,
	 scorediff INT NOT NULL,
     PRIMARY KEY (matchID),
     UNIQUE (matchID),
	 FOREIGN KEY (matchup) REFERENCES teams (TeamID)
);

-- Creating Regular_Players TABLE for Raptors
DROP TABLE IF EXISTS public.regularplayers;
CREATE TABLE regularplayers (
	 matchID VARCHAR(10) NOT NULL,
	 playerID VARCHAR (40) NOT NULL,
	 minutes INT NOT NULL,
	 points INT NOT NULL,
	 FGM INT NOT NULL,
	 FGA INT NOT NULL,
	 FGpercentage FLOAT,
	 _3PM INT NOT NULL,
	 _3PA INT NOT NULL,
	 _3Ppercentage FLOAT,
	 FTM INT NOT NULL,
	 FTA INT NOT NULL,
	 FTpercentage FLOAT, 
	 OREB INT NOT NULL,
	 DREB INT NOT NULL,
	 REB INT NOT NULL, 
	 AST INT NOT NULL,
	 STL INT NOT NULL,
	 BLK INT NOT NULL,
	 TOV INT NOT NULL,
	 PF INT NOT NULL,
	 scorediff INT NOT NULL,
	 FOREIGN KEY (matchid) REFERENCES regulars (matchid),
	 FOREIGN KEY (playerid) REFERENCES players (playerid),
	 PRIMARY KEY (matchid, playerid)
);

-- Creating Playoffs_Players TABLE for Raptors
DROP TABLE IF EXISTS public.playoffsplayers;
CREATE TABLE playoffsplayers (
	 matchID VARCHAR(10) NOT NULL,
	 playerID VARCHAR (40) NOT NULL,
	 minutes INT NOT NULL,
	 points INT NOT NULL,
	 FGM INT NOT NULL,
	 FGA INT NOT NULL,
	 FGpercentage FLOAT,
	 _3PM INT NOT NULL,
	 _3PA INT NOT NULL,
	 _3Ppercentage FLOAT,
	 FTM INT NOT NULL,
	 FTA INT NOT NULL,
	 FTpercentage FLOAT, 
	 OREB INT NOT NULL,
	 DREB INT NOT NULL,
	 REB INT NOT NULL, 
	 AST INT NOT NULL,
	 STL INT NOT NULL,
	 BLK INT NOT NULL,
	 TOV INT NOT NULL,
	 PF INT NOT NULL,
	 scorediff INT NOT NULL,
	 FOREIGN KEY (matchid) REFERENCES playoffs (matchid),
	 FOREIGN KEY (playerid) REFERENCES players (playerid),
	 PRIMARY KEY (matchid, playerid)
);