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

-- Create Music Table
CREATE TABLE music_albums (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    on_spotify BOOLEAN,
    publish_date DATE,
    genre_id INT REFERENCES Genre(id),
);

-- Create Source Table
CREATE TABLE source (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(55)
);

-- Create Genre Table
CREATE TABLE genre (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(55)
);
