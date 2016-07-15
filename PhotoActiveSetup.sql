CREATE TABLE IF NOT EXISTS users (
  id serial NOT NULL primary key,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS photos (
  id serial NOT NULL primary key,
  url VARCHAR(255) NOT NULL,
  lat numeric NOT NULL,
  lng numeric NOT NULL,
  user_id INT NOT NULL references users(id),
  cache_id INT
);

CREATE TABLE IF NOT EXISTS caches (
  id serial NOT NULL primary key,
  master_photo INT NOT NULL references photos(id)
);

CREATE TABLE IF NOT EXISTS cache_for_user (
  id serial NOT NULL primary key,
  user_id INT NOT NULL references users(id),
  cache_id INT NOT NULL references caches(id)
);

CREATE TABLE IF NOT EXISTS reports (
  id serial NOT NULL primary key,
  photo_id INT NOT NULL references photos(id),
  user_id INT NOT NULL references users(id),
  reason VARCHAR(255) NOT NULL,
  description TEXT
);
