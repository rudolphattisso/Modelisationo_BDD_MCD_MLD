CREATE TABLE TEAM(
   team_id VARCHAR(50),
   name VARCHAR(50) NOT NULL,
   creation_date DATE NOT NULL,
   PRIMARY KEY(team_id)
);

CREATE TABLE PLAYER(
   player_id VARCHAR(50),
   lastname VARCHAR(254) NOT NULL,
   surname VARCHAR(50) NOT NULL,
   birthdate DATE NOT NULL,
   team_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(player_id),
   FOREIGN KEY(team_id) REFERENCES TEAM(team_id)
);

CREATE TABLE REFEREE(
   referee_id VARCHAR(50),
   lastname VARCHAR(254) NOT NULL,
   surname VARCHAR(50) NOT NULL,
   PRIMARY KEY(referee_id)
);

CREATE TABLE MATCH__(
   match_id VARCHAR(50),
   start_date_time DATETIME NOT NULL,
   result_team VARCHAR(50) NOT NULL,
   result_team_1 VARCHAR(50) NOT NULL,
   referee_id VARCHAR(50) NOT NULL,
   team_id VARCHAR(50) NOT NULL,
   team_id_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(match_id),
   FOREIGN KEY(referee_id) REFERENCES REFEREE(referee_id),
   FOREIGN KEY(team_id) REFERENCES TEAM(team_id),
   FOREIGN KEY(team_id_1) REFERENCES TEAM(team_id)
);
