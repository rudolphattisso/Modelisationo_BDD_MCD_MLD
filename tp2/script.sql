CREATE TABLE CLASSROOM(
   classroom_id VARCHAR(50) ,
   num VARCHAR(50)  NOT NULL,
   PRIMARY KEY(classroom_id)
);

CREATE TABLE Personne(
   Id_Personne SERIAL,
   lastname VARCHAR(254)  NOT NULL,
   surname VARCHAR(50)  NOT NULL,
   birthdate DATE NOT NULL,
   PRIMARY KEY(Id_Personne)
);

CREATE TABLE CLASS(
   class_id VARCHAR(50) ,
   name VARCHAR(50)  NOT NULL,
   creation_date DATE NOT NULL,
   classroom_id VARCHAR(50)  NOT NULL,
   PRIMARY KEY(class_id),
   UNIQUE(classroom_id),
   FOREIGN KEY(classroom_id) REFERENCES CLASSROOM(classroom_id)
);

CREATE TABLE STUDENT(
   student_id VARCHAR(50) ,
   class_id VARCHAR(50)  NOT NULL,
   Id_Personne INTEGER NOT NULL,
   PRIMARY KEY(student_id),
   UNIQUE(Id_Personne),
   FOREIGN KEY(class_id) REFERENCES CLASS(class_id),
   FOREIGN KEY(Id_Personne) REFERENCES Personne(Id_Personne)
);

CREATE TABLE PROFESSOR(
   professor_id VARCHAR(50) ,
   Id_Personne INTEGER NOT NULL,
   PRIMARY KEY(professor_id),
   UNIQUE(Id_Personne),
   FOREIGN KEY(Id_Personne) REFERENCES Personne(Id_Personne)
);

CREATE TABLE SUBJECT(
   id_subject VARCHAR(50) ,
   name VARCHAR(50)  NOT NULL,
   professor_id VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_subject),
   FOREIGN KEY(professor_id) REFERENCES PROFESSOR(professor_id)
);

CREATE TABLE notation(
   student_id VARCHAR(50) ,
   id_subject VARCHAR(50) ,
   note NUMERIC(15,2)  ,
   PRIMARY KEY(student_id, id_subject),
   FOREIGN KEY(student_id) REFERENCES STUDENT(student_id),
   FOREIGN KEY(id_subject) REFERENCES SUBJECT(id_subject)
);

CREATE TABLE TRAINING(
   class_id VARCHAR(50) ,
   id_subject VARCHAR(50) ,
   time_amount INTEGER NOT NULL,
   PRIMARY KEY(class_id, id_subject),
   FOREIGN KEY(class_id) REFERENCES CLASS(class_id),
   FOREIGN KEY(id_subject) REFERENCES SUBJECT(id_subject)
);
