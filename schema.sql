CREATE DATABASE things;

CREATE TABLE item(
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date Date, 
  archived Boolean,
  label_id int, 
  author_id int,
  genre_id int NOT NULL,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE Author(
    id int generated always as identity,
    first_name varchar(50),
    last_name varchar(50),
    primary key (id)
);

CREATE TABLE Games(
    id Int generated always as identity,
    multplayer  boolean,
    last_played_at  date,
    publish_date  date,
    archived  boolean,
    author_id  int,
    CONSTRAINT fk_label FOREIGN KEY (author_id) REFERENCES Author(id),
    PRIMARY KEY (id)
);

-- Create the Album table
CREATE TABLE Album (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    artist VARCHAR(255),
    publish_date DATE,
    on_spotify BOOLEAN,
    genre_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

-- Create the Genre table
CREATE TABLE Genre (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY (id)
);
