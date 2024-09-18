CREATE TABLE TEAM(
   team_id VARCHAR(50),
   name VARCHAR(50) NOT NULL,
   creation_date DATE NOT NULL,
   PRIMARY KEY(team_id)
);

CREATE TABLE Personne(
   Id_Personne COUNTER,
   lastname VARCHAR(50) NOT NULL,
   surname VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Personne)
);

CREATE TABLE PLAYER(
   player_id VARCHAR(50),
   birthdate DATE NOT NULL,
   team_id VARCHAR(50),
   Id_Personne INT NOT NULL,
   PRIMARY KEY(player_id),
   UNIQUE(Id_Personne),
   FOREIGN KEY(team_id) REFERENCES TEAM(team_id),
   FOREIGN KEY(Id_Personne) REFERENCES Personne(Id_Personne)
);

CREATE TABLE REFEREE(
   referee_id VARCHAR(50),
   Id_Personne INT NOT NULL,
   PRIMARY KEY(referee_id),
   UNIQUE(Id_Personne),
   FOREIGN KEY(Id_Personne) REFERENCES Personne(Id_Personne)
);

CREATE TABLE MATCH__(
   match_id VARCHAR(50),
   start_time DATE NOT NULL,
   time_ TIME,
   referee_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(match_id),
   FOREIGN KEY(referee_id) REFERENCES REFEREE(referee_id)
);

CREATE TABLE participate(
   team_id VARCHAR(50),
   match_id VARCHAR(50),
   PRIMARY KEY(team_id, match_id),
   FOREIGN KEY(team_id) REFERENCES TEAM(team_id),
   FOREIGN KEY(match_id) REFERENCES MATCH__(match_id)
);
