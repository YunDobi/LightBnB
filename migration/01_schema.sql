DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;

create table users (
  id serial primary key NOT NULL,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  thumbnail_photo_url VARCHAR(255) NOT NULL,
  cover_photo_url VARCHAR(255) NOT NULL,
  cost_per_night INTEGER  NOT NULL DEFAULT 0,
  parking_spaces INTEGER  NOT NULL DEFAULT 0,
  number_of_bathrooms INTEGER  NOT NULL DEFAULT 0,
  number_of_bedrooms INTEGER  NOT NULL DEFAULT 0,

  country VARCHAR(255) NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  post_code VARCHAR(255) NOT NULL,

  active BOOLEAN NOT NULL DEFAULT TRUE
);

create table reservations (
  id serial primary key NOT NULL,
  start_date date NOT NULL,
  end_date date NOT NULL,
  property_id integer references properties(id) on delete cascade,
  guest_id integer references users(id) on delete CASCADE
);

create table property_reviews (
  id serial primary key NOT NULL,
  guest_id integer references users(id) on delete cascade,
  property_id integer references properties(id) on delete cascade,
  reservation_id integer references reservations(id) on delete cascade,
  rating smallint NOT NULL DEFAULT 0,
  message TEXT
);