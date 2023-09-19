CREATE table planet
(id SERIAL PRIMARY KEY,
name varchar(20) NOT NULL,
water boolean,
vegetation boolean,
life boolean,
atmosphere boolean,
satellite boolean
);

CREATE table civilization(
    id SERIAL PRIMARY KEY,
    name varchar(20) NOT NULL,
    life_expectancy integer NOT NULL CHECK (life_expectancy>=0),
    telepathy boolean,
    reproduction varchar(30)
);


CREATE table person(
    id SERIAL PRIMARY KEY,
    name varchar(20) NOT NULL,
    age integer NOT NULL CHECK ( age>=0),
    civilization_id INTEGER REFERENCES civilization(id)
);

CREATE table city_history(
    id SERIAL PRIMARY KEY,
    data date NOT NULL,
    populated boolean,
    percentage_of_destruction integer,
    civilization_id INTEGER REFERENCES civilization(id),
    city_id INTEGER REFERENCES city(id)
);

CREATE table city(
    id SERIAL PRIMARY KEY,
    name varchar(20) NOT NULL,
    planet_id INTEGER REFERENCES planet(id)
);

CREATE TABLE location(
    id SERIAL PRIMARY KEY,
    city_id INTEGER REFERENCES city(id)
);

CREATE TABLE journey
(
    id SERIAL PRIMARY KEY,
    person_id INTEGER REFERENCES person(id),
    location_id INTEGER REFERENCES location(id),
    arrival_time timestamp NOT NULL,
    departure_time timestamp
);

INSERT INTO planet(name, water, vegetation, life, atmosphere, satellite)
VALUES ('Земля', true, true, true, true, true),
('Центральное Солнце', false, false, false, true, false),
       ('Второе Солнце', true, true, true, false, false),
       ('Третье Солнце', false, false, false, true, false),
       ('Четвертое Солнце', true, true, true, false, true);

INSERT INTO civilization(name, life_expectancy, telepathy, reproduction)
VALUES ('Жители Диаспара', 300, false, 'Перерождение'),
        ('Жители Лиза', 100, true, 'Естественным путем'),
       ('Древние жители', 90, null, null);

INSERT INTO person(name, age, civilization_id)
VALUES ('Olvin', 20,1),
       ('Hedron', 50, 1),
       ('Sirenis', 100, 2),
       ('Alistra', 18, 1),
       ('Hilvar', 23, 2),
       ('Dzizirak', 72, 1);

INSERT INTO city(name, planet_id)
VALUES ('Диаспар', 1),
       ('Лиз', 1),
       ('Древний город', 5);


INSERT INTO city_history(data, populated, percentage_of_destruction, civilization_id, city_id)
VALUES ('1400-05-15', false, 100, 1,1),
       ('1400-05-15', true, 100, 2, 2),
       ('1400-05-15', false, 0, 3, 3),
       ('2040-05-15', true, 0, 1,1),
       ('2040-05-15', true, 0, 2, 2),
       ('2040-05-15', false, 80, 3, 3),
       ('2040-05-15', true, 0, 1, 1),
       ('2040-05-15', true, 0, 2, 2),
       ('2040-05-15', false, 90, 3, 3);

INSERT INTO location(city_id)
VALUES (1),
       (2),
       (3);

INSERT INTO journey(person_id, location_id, arrival_time, departure_time)
VALUES (1, 1, '2000-04-15 00:03:20', '2030-04-15 00:03:20'),
       (1, 2, '2030-04-15 00:03:20', '2030-08-17 07:04:29'),
       (1, 1, '2030-08-17 07:04:29', '2032-09-17 07:04:29'),
       (1, 3, '2032-09-17 11:04:29', '2032-10-17 22:04:29'),
       (5, 3, '1999-10-01 05:10:15', '2032-09-17 09:04:29'),
       (5, 3, '2032-09-17 11:04:29', '2032-10-17 22:04:29'),
       (5, 3, '2032-09-17 11:04:29', '2032-10-17 22:04:29');
