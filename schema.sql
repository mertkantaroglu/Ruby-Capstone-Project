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