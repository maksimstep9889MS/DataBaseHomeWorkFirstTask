CREATE TABLE genre (
  genre_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE artist (
  artist_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE album (
  album_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL CHECK (year >= 1960)
);

CREATE TABLE track (
  track_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  duration INTEGER NOT NULL CHECK (duration >= 0 AND duration <= 420),
  album_id INTEGER NOT NULL,
  CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES album(album_id)
);

CREATE TABLE compilations (
  compilation_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  release_year INTEGER NOT NULL CHECK (release_year >= 1960)
);

CREATE TABLE compilation_tracks (
  compilation_tracks_id SERIAL PRIMARY KEY,
  compilation_id INTEGER NOT NULL,
  track_id INTEGER NOT NULL,
  CONSTRAINT fk_compilation FOREIGN KEY(compilation_id) REFERENCES compilations(compilation_id),
  CONSTRAINT fk_track FOREIGN KEY(track_id) REFERENCES track(track_id)
);

CREATE TABLE artist_genres (
  artist_genre_id SERIAL PRIMARY KEY,
  artist_id INTEGER NOT NULL,
  genre_id INTEGER NOT NULL,
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
  CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE artist_albums (
  artist_album_id SERIAL PRIMARY KEY,
  artist_id INTEGER NOT NULL,
  album_id INTEGER NOT NULL,
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
  CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES album(album_id)
);

INSERT INTO genre (name) VALUES
('Classical'),
('Rap'),
('Rock'),
('Pop');

INSERT INTO artist (name) VALUES
('Zimmer'),
('Eminem'),
('The Beatles'),
('ABBA');

INSERT INTO album (name, year) VALUES
('Album_1', 2010),
('Album_2', 2002),
('Album_3', 1969),
('Album_4', 1980);

INSERT INTO track (name, duration, album_id) VALUES
('Track 1', 380, 1),
('Track 2', 340, 2),
('Track 3', 420, 4),
('Track 4', 400, 1),
('Track 5', 210, 2),
('Track 6', 250, 3);

INSERT INTO compilations (title, release_year) VALUES
('Compilation 1', 2022),
('Compilation 2', 2017),
('Compilation 3', 1975),
('Compilation 4', 1990);

INSERT INTO compilation_tracks (compilation_id, track_id) VALUES
(1, 3),
(4, 2),
(3, 1),
(2, 4),
(2, 6),
(4, 5);

INSERT INTO artist_genres (artist_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO artist_albums (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

