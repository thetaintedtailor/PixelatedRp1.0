USE `essentialmode`;

CREATE TABLE `shops` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`store` varchar(100) NOT NULL,
	`item` varchar(100) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `shops` (store, item, price) VALUES
	('TwentyFourSeven','burger',30),
	('TwentyFourSeven','water',15),
	('RobsLiquor','burger',30),
	('RobsLiquor','water',15),
	('LTDgasoline','burger',30),
	('LTDgasoline','water',15)
;