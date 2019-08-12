UPDATE licenses SET label = "Driver's License" WHERE type = 'drive';
UPDATE licenses SET label = "Motorcycle License" WHERE type = 'drive_bike';
UPDATE licenses SET label = "Commercial Driver's License" WHERE type = 'drive_truck';

DELETE FROM user_licenses WHERE type = "weapon";
DELETE FROM user_licenses WHERE type = "weed_processing";
DELETE FROM licenses WHERE type = "weapon";
DELETE FROM licenses WHERE type = "weed_processing";

INSERT INTO licenses (type, label) VALUES 
    ('weapon_1', 'Class 1 Weapons Permit'), ('weapon_2', 'Class 2 Weapons Permit') ('fishing', 'Fishing License');

ALTER TABLE weashops ADD COLUMN license VARCHAR(255);

INSERT INTO weashops (zone, item, price, license) VALUES 
    ('GunShop', 'WEAPON_KNIFE', 75, NULL),
    ('GunShop', 'WEAPON_PISTOL50', 2500, 'weapon_1'),
    ('GunShop', 'WEAPON_PUMPSHOTGUN', 5000, 'weapon_2'),
    ('GunShop', 'WEAPON_SAWNOFFSHOTGUN', 4000, 'weapon_2'),
    ('GunShop', 'WEAPON_ASSAULTSHOTGUN', 7000, 'weapon_2'),
    ('GunShop', 'WEAPON_BULLPOPSHOTGUN', 7000, 'weapon_2'),
    ('GunShop', 'WEAPON_VINTAGEPISTOL', 5000, 'weapon_1'),
    ('GunShop', 'WEAPON_DAGGER', 200, NULL),
    ('GunShop', 'WEAPON_HEAVYSHOTGUN', 10000, 'weapon_2'),
    ('GunShop', 'WEAPON_HATCHET', 200, NULL),
    ('GunShop', 'WEAPON_KNUCKLE', 400, NULL),
    ('GunShop', 'WEAPON_FIREWORK', 500, 'weapon_1'),
    ('GunShop', 'WEAPON_MARKSMANPISTOL', 4500, 'weapon_1'),
    ('GunShop', 'WEAPON_REVOLVER', 3000, 'weapon_1'),
    ('GunShop', 'WEAPON_DBSHOTGUN', 6000, 'weapon_2'),
    ('GunShop', 'WEAPON_BATTLEAXE', 1000, NULL),
    ('GunShop', 'WEAPON_POOLCUE', 100, NULL),
    ('GunShop', 'WEAPON_WRENCH', 20, NULL);
