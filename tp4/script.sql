CREATE TABLE role_(
   id INT,
   description VARCHAR(50),
   hierarchy_level VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE discipline(
   id INT,
   PRIMARY KEY(id)
);

CREATE TABLE station(
   id INT,
   station_altitude INT NOT NULL,
   station_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE country(
   id INT,
   iso_country_code VARCHAR(3),
   _name__ VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE event_team(
   id INT,
   PRIMARY KEY(id)
);

CREATE TABLE person(
   id VARCHAR(6),
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   address VARCHAR(50),
   phone_number VARCHAR(50),
   country_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(country_id) REFERENCES country(id)
);

CREATE TABLE athlete(
   id INT,
   gold_medal COUNTER NOT NULL,
   silver_medal COUNTER,
   bronze_medal COUNTER,
   person_id VARCHAR(6) NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(person_id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE staff(
   id INT,
   role_id INT NOT NULL,
   person_id VARCHAR(6) NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(person_id),
   FOREIGN KEY(role_id) REFERENCES role_(id),
   FOREIGN KEY(person_id) REFERENCES person(id)
);

CREATE TABLE event(
   id VARCHAR(50),
   alpha_code VARCHAR(2),
   date_ DATE NOT NULL,
   discipline_id INT NOT NULL,
   station_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(discipline_id) REFERENCES discipline(id),
   FOREIGN KEY(station_id) REFERENCES station(id)
);

CREATE TABLE round(
   id INT,
   event_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(event_id) REFERENCES event(id)
);

CREATE TABLE manages(
   manager_id INT,
   subordinate_id INT,
   PRIMARY KEY(manager_id, subordinate_id),
   FOREIGN KEY(manager_id) REFERENCES staff(id),
   FOREIGN KEY(subordinate_id) REFERENCES staff(id)
);

CREATE TABLE participates_time(
   event_team_id INT,
   round_id INT,
   time_ TIME NOT NULL,
   PRIMARY KEY(event_team_id, round_id),
   FOREIGN KEY(event_team_id) REFERENCES event_team(id),
   FOREIGN KEY(round_id) REFERENCES round(id)
);

CREATE TABLE is_in(
   athlete_id INT,
   event_team_id INT,
   bib_number VARCHAR(50),
   PRIMARY KEY(athlete_id, event_team_id),
   FOREIGN KEY(athlete_id) REFERENCES athlete(id),
   FOREIGN KEY(event_team_id) REFERENCES event_team(id)
);

CREATE TABLE participates_score(
   round_id INT,
   event_team_id INT,
   score INT NOT NULL,
   PRIMARY KEY(round_id, event_team_id),
   FOREIGN KEY(round_id) REFERENCES round(id),
   FOREIGN KEY(event_team_id) REFERENCES event_team(id)
);

CREATE TABLE supervise(
   id INT,
   id_1 VARCHAR(50),
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES staff(id),
   FOREIGN KEY(id_1) REFERENCES event(id)
);
