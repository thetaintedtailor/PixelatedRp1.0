UPDATE licenses SET label = "Driver's License" WHERE type = 'drive';
UPDATE licenses SET label = "Motorcycle License" WHERE type = 'drive_bike';
UPDATE licenses SET label = "Commercial Driver's License" WHERE type = 'drive_truck';

DELETE FROM user_licenses WHERE type = "weapon";
DELETE FROM user_licenses WHERE type = "weed_processing";
DELETE FROM licenses WHERE type = "weapon";
DELETE FROM licenses WHERE type = "weed_processing";

INSERT INTO licenses (type, label) VALUES ('weapon_1', 'Class 1 Weapons Permit'), ('weapon_2', 'Class 2 Weapons Permit');
