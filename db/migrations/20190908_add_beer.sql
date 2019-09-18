DELETE FROM items WHERE name = 'beer';
INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('beer', 'Beer', 3);

DELETE FROM shops WHERE item = 'beer';
INSERT INTO shops (store, item, price) VALUES
  ('RobsLiquor', 'beer', 8);