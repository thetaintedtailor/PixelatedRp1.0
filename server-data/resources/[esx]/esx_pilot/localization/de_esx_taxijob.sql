USE `gta5_gamemode_essential`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_plane','Pilot',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_plane','Pilot',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('pilot','Pilot')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('pilot',0,'recrue','Recrue',12,'{}','{}'),
  ('pilot',1,'novice','Novice',24,'{}','{}'),
  ('pilot',2,'experimente','Experimente',36,'{}','{}'),
  ('pilot',3,'uber','Uber',48,'{}','{}'),
  ('pilot',4,'boss','Patron',0,'{}','{}')
;
