UPDATE items SET items.limit = 3 WHERE name = 'lockpick';

INSERT INTO shops (store, item, price) VALUES
  ('Punkskaido', 'lockpick', 10000);
