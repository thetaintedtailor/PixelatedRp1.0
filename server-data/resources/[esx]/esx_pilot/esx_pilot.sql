INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_pilot','Pilot',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_pilot','Pilot',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('pilot','Pilot')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('pilot',0,'recrue','Recrue',250,'{}','{}'),
  ('pilot',1,'novice','Novice',500,'{}','{}'),
  ('pilot',2,'experimente','Experimente',750,'{}','{}'),
  ('pilot',3,'boss','Patron',0,'{}','{}')
;
