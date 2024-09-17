CREATE TABLE role_(
   id_role COUNTER,
   description VARCHAR(50),
   hierarchy_level VARCHAR(50),
   PRIMARY KEY(id_role)
);

CREATE TABLE discipline(
   id_discipline COUNTER,
   PRIMARY KEY(id_discipline)
);

CREATE TABLE station(
   id_station COUNTER,
   station_altitude INT NOT NULL,
   station_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_station)
);

CREATE TABLE country(
   id_country COUNTER,
   iso_country_code VARCHAR(2),
   PRIMARY KEY(id_country)
);

CREATE TABLE team(
   team_id COUNTER,
   medal VARCHAR(50),
   PRIMARY KEY(team_id)
);

CREATE TABLE person(
   id_person VARCHAR(6),
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   address VARCHAR(50),
   phone_number VARCHAR(50),
   id_country INT NOT NULL,
   PRIMARY KEY(id_person),
   FOREIGN KEY(id_country) REFERENCES country(id_country)
);

CREATE TABLE athlete(
   id_athlete COUNTER,
   id_person VARCHAR(6) NOT NULL,
   PRIMARY KEY(id_athlete),
   UNIQUE(id_person),
   FOREIGN KEY(id_person) REFERENCES person(id_person)
);

CREATE TABLE staff(
   id_staff COUNTER,
   id_role INT NOT NULL,
   id_person VARCHAR(6) NOT NULL,
   PRIMARY KEY(id_staff),
   UNIQUE(id_person),
   FOREIGN KEY(id_role) REFERENCES role_(id_role),
   FOREIGN KEY(id_person) REFERENCES person(id_person)
);

CREATE TABLE event(
   id_event VARCHAR(50),
   alpha_code VARCHAR(2),
   id_discipline INT NOT NULL,
   id_station INT NOT NULL,
   PRIMARY KEY(id_event),
   FOREIGN KEY(id_discipline) REFERENCES discipline(id_discipline),
   FOREIGN KEY(id_station) REFERENCES station(id_station)
);

CREATE TABLE round(
   id_round COUNTER,
   id_event VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_round),
   FOREIGN KEY(id_event) REFERENCES event(id_event)
);

CREATE TABLE manages(
   id_staff INT,
   id_staff_1 INT,
   PRIMARY KEY(id_staff, id_staff_1),
   FOREIGN KEY(id_staff) REFERENCES staff(id_staff),
   FOREIGN KEY(id_staff_1) REFERENCES staff(id_staff)
);

CREATE TABLE participates_time(
   team_id INT,
   id_round INT,
   time_ TIME NOT NULL,
   PRIMARY KEY(team_id, id_round),
   FOREIGN KEY(team_id) REFERENCES team(team_id),
   FOREIGN KEY(id_round) REFERENCES round(id_round)
);

CREATE TABLE is_in(
   id_athlete INT,
   team_id INT,
   bib_number VARCHAR(50),
   PRIMARY KEY(id_athlete, team_id),
   FOREIGN KEY(id_athlete) REFERENCES athlete(id_athlete),
   FOREIGN KEY(team_id) REFERENCES team(team_id)
);

CREATE TABLE participates_score(
   id_round INT,
   team_id INT,
   score INT NOT NULL,
   PRIMARY KEY(id_round, team_id),
   FOREIGN KEY(id_round) REFERENCES round(id_round),
   FOREIGN KEY(team_id) REFERENCES team(team_id)
);
