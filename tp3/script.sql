CREATE TABLE room(
   id_room VARCHAR(50),
   address VARCHAR(254) NOT NULL,
   email VARCHAR(254) NOT NULL,
   phone_number VARCHAR(50) NOT NULL,
   website VARCHAR(254) NOT NULL,
   name VARCHAR(254) NOT NULL,
   PRIMARY KEY(id_room)
);

CREATE TABLE spectacle(
   id_spectacle VARCHAR(50),
   name VARCHAR(254) NOT NULL,
   price DECIMAL(15,2) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   PRIMARY KEY(id_spectacle)
);

CREATE TABLE concert(
   id_concert VARCHAR(50),
   id_spectacle VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_concert),
   UNIQUE(id_spectacle),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id_spectacle)
);

CREATE TABLE show(
   id_show VARCHAR(50),
   start_date_time DATETIME NOT NULL,
   end_date_time DATETIME NOT NULL,
   id_spectacle VARCHAR(50),
   PRIMARY KEY(id_show),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id_spectacle)
);

CREATE TABLE person(
   id_person VARCHAR(50),
   surname VARCHAR(50) NOT NULL,
   lastname VARCHAR(254) NOT NULL,
   phone_number VARCHAR(50),
   PRIMARY KEY(id_person)
);

CREATE TABLE theatre(
   id_theatre VARCHAR(50),
   id_spectacle VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_theatre),
   UNIQUE(id_spectacle),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id_spectacle)
);

CREATE TABLE client(
   id_client VARCHAR(50),
   id_person VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_client),
   UNIQUE(id_person),
   FOREIGN KEY(id_person) REFERENCES person(id_person)
);

CREATE TABLE staff(
   id_staff VARCHAR(50),
   id_person VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_staff),
   UNIQUE(id_person),
   FOREIGN KEY(id_person) REFERENCES person(id_person)
);

CREATE TABLE actor(
   id_theatre VARCHAR(50),
   id_staff VARCHAR(50),
   PRIMARY KEY(id_theatre, id_staff),
   FOREIGN KEY(id_theatre) REFERENCES theatre(id_theatre),
   FOREIGN KEY(id_staff) REFERENCES staff(id_staff)
);

CREATE TABLE technical_staff(
   id_theatre VARCHAR(50),
   id_staff VARCHAR(50),
   PRIMARY KEY(id_theatre, id_staff),
   FOREIGN KEY(id_theatre) REFERENCES theatre(id_theatre),
   FOREIGN KEY(id_staff) REFERENCES staff(id_staff)
);

CREATE TABLE take_place(
   id_room VARCHAR(50),
   id_spectacle VARCHAR(50),
   PRIMARY KEY(id_room, id_spectacle),
   FOREIGN KEY(id_room) REFERENCES room(id_room),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id_spectacle)
);

CREATE TABLE order_(
   id_show VARCHAR(50),
   id_client VARCHAR(50),
   qtt INT NOT NULL,
   order_date_time DATETIME NOT NULL,
   type booking_type NOT NULL,
   total DECIMAL(15,2) NOT NULL,
   PRIMARY KEY(id_show, id_client),
   FOREIGN KEY(id_show) REFERENCES show(id_show),
   FOREIGN KEY(id_client) REFERENCES client(id_client)
);
