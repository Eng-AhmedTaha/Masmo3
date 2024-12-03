CREATE TABLE Narrator
(
  ID INT NOT NULL,
  Name INT NOT NULL,
  City INT NOT NULL,
  Street INT NOT NULL,
  ZipCode INT NOT NULL,
  Phone INT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Author
(
  ID INT NOT NULL,
  email INT NOT NULL,
  Name INT NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (email)
);

CREATE TABLE Genre
(
  Name INT NOT NULL,
  PRIMARY KEY (Name)
);

CREATE TABLE Audio_Book
(
  ID INT NOT NULL,
  Title INT NOT NULL,
  Publication_Date INT NOT NULL,
  Author_Id INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (Author_Id) REFERENCES Author(ID),
  UNIQUE (Title)
);

CREATE TABLE Book
(
  Title INT NOT NULL,
  ISBN INT NOT NULL,
  GenreName INT NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (Title),
  FOREIGN KEY (GenreName) REFERENCES Genre(Name),
  FOREIGN KEY (ID) REFERENCES Author(ID)
);

CREATE TABLE Narrate
(
  Narrator_Id INT NOT NULL,
  AudioBook_Id INT NOT NULL,
  PRIMARY KEY (Narrator_Id, AudioBook_Id),
  FOREIGN KEY (Narrator_Id) REFERENCES Audio_Book(ID),
  FOREIGN KEY (AudioBook_Id) REFERENCES Narrator(ID)
);

CREATE TABLE Base_on
(
  ID INT NOT NULL,
  Title INT NOT NULL,
  PRIMARY KEY (ID, Title),
  FOREIGN KEY (ID) REFERENCES Audio_Book(ID),
  FOREIGN KEY (Title) REFERENCES Book(Title)
);