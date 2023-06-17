CREATE TABLE pizzas (
pizzas_id SERIAL PRIMARY KEY,
pizzas_name VARCHAR(255) NOT NULL,
pizzas_calories INT NOT NULL,
pizzas_description VARCHAR(255)
);

CREATE TABLE weapons (
weapons_id SERIAL PRIMARY KEY,
weapons_name VARCHAR(255) NOT NULL,
weapons_dps INT NOT NULL
);

CREATE TABLE turtles (
turtles_id SERIAL PRIMARY KEY,
turtles_name VARCHAR(255) NOT NULL,
turtles_color VARCHAR(255) NOT NULL,
turtles_weaponId INT,
turtles_favoritePizzaId INT,
turtles_secondFavoritePizzaId INT ,
turtles_image VARCHAR(255),
CONSTRAINT fk_weaponId_turtles FOREIGN KEY (turtles_weaponId) REFERENCES weapons (weapons_id),
CONSTRAINT fk_favoritePizzaId_turtles FOREIGN KEY (turtles_favoritePizzaId) REFERENCES pizzas (pizzas_id),
CONSTRAINT fk_secondFavoritePizzaId_turtles FOREIGN KEY (turtles_secondFavoritePizzaId) REFERENCES pizzas (pizzas_id)
);

INSERT INTO pizzas (pizzas_name, pizzas_calories) VALUES ('mozarello', 1000);
INSERT INTO pizzas (pizzas_name, pizzas_calories) VALUES ('home', 800);
INSERT INTO pizzas (pizzas_name, pizzas_calories) VALUES ('fourseasons', 1200);
INSERT INTO pizzas (pizzas_name, pizzas_calories) VALUES ('pesto', 1500);
INSERT INTO pizzas (pizzas_name, pizzas_calories) VALUES ('cheese', 400);

INSERT INTO weapons (weapons_name, weapons_dps) VALUES ('katana', 200);
INSERT INTO weapons (weapons_name, weapons_dps) VALUES ('daggers-sai', 400);
INSERT INTO weapons (weapons_name, weapons_dps) VALUES ('pole-bo', 250);
INSERT INTO weapons (weapons_name, weapons_dps) VALUES ('nunchaku', 300);

--new
INSERT INTO turtles (turtles_name, turtles_color, turtles_image, turtles_favoritepizzaid, turtles_secondFavoritePizzaId, turtles_weaponId)
VALUES ('Leonardo', 'blue', 'leonardo.jpg', 1, 1, 2);
INSERT INTO turtles (turtles_name, turtles_color, turtles_image, turtles_weaponId, turtles_favoritePizzaId, turtles_secondFavoritePizzaId)
VALUES ('Raphael', 'red', 'rafael.jpg', 2, 2, 3);
INSERT INTO turtles (turtles_name, turtles_color, turtles_image, turtles_weaponId, turtles_favoritePizzaId, turtles_secondFavoritePizzaId)
VALUES ('Donatello', 'purple', 'donatelo.jpg', 3, 3, 4);
INSERT INTO turtles (turtles_name, turtles_color, turtles_image, turtles_weaponId, turtles_favoritePizzaId, turtles_secondFavoritePizzaId)
VALUES ('Michelangelo', 'orange', 'mikelangello.jpg', 4, 4, 5);

drop table if exists turtles;
drop table if exists pizzas, weapons;
