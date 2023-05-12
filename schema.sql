-- Create Item Table
CREATE TABLE Item (
  id INT PRIMARY KEY,
  genre VARCHAR(55),
  author VARCHAR(55),
  source VARCHAR(55),
  label VARCHAR(55),
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  can_be_archived BOOLEAN,
  move_to_archive BOOLEAN,
  add_genre INT REFERENCES Genre(id),
  add_source INT REFERENCES Source(id),
  add_author INT REFERENCES Author(id),
  add_label INT REFERENCES Label(id)
);

-- Create Movie Table
CREATE TABLE movie (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  silent BOOLEAN,
  source_id INT REFERENCES Source(id)
);

-- Create Source Table
CREATE TABLE source (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(55)
);

-- Create labels table
CREATE TABLE LABEL(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255),
);

-- Create books table
CREATE TABLE BOOK(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  genre_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT fk_book_genre FOREIGN KEY (genre_id) REFERENCES GENRES(id),
  CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES AUTHORS(id),
  CONSTRAINT fk_book_label FOREIGN KEY (label_id) REFERENCES LABELS(id),
);
