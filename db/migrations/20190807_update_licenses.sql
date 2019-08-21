UPDATE licenses SET label = "Driver's License" WHERE type = 'drive';
UPDATE licenses SET label = "Motorcycle License" WHERE type = 'drive_bike';
UPDATE licenses SET label = "Commercial Driver's License" WHERE type = 'drive_truck';

DELETE FROM user_licenses WHERE type = "weed_processing";
DELETE FROM licenses WHERE type = "weapon";
DELETE FROM licenses WHERE type = "weed_processing";

INSERT INTO licenses (type, label) VALUES 
    ('weapon_1', 'Class 1 Weapons Permit'), ('weapon_2', 'Class 2 Weapons Permit'), ('fishing', 'Fishing License')
    ON DUPLICATE KEY UPDATE label = label;

UPDATE user_licenses SET type = 'weapon_1' WHERE type = 'weapon';

ALTER TABLE weashops ADD COLUMN license VARCHAR(255);

CREATE UNIQUE INDEX idx_zone_item_weashops ON weashops(zone, item);

DELETE FROM user_inventory WHERE item = 'class2permit';
DELETE FROM user_inventory WHERE item = 'pistolpermit';
DELETE FROM items WHERE name = 'class2permit';
DELETE FROM items WHERE name = 'pistolpermit';

DELETE FROM weashops WHERE zone = 'GunShop' AND item IN (
  'WEAPON_FLASHLIGHT',
  'WEAPON_MACHETE',
  'WEAPON_NIGHTSTICK',
  'WEAPON_BAT',
  'WEAPON_STUNGUN',
  'WEAPON_FIREEXTINGUISHER',
  'WEAPON_PISTOL',
  'WEAPON_KNIFE',
  'WEAPON_PISTOL50',
  'WEAPON_PUMPSHOTGUN',
  'WEAPON_SAWNOFFSHOTGUN',
  'WEAPON_ASSAULTSHOTGUN',
  'WEAPON_BULLPUPSHOTGUN',
  'WEAPON_VINTAGEPISTOL',
  'WEAPON_DAGGER',
  'WEAPON_HEAVYSHOTGUN',
  'WEAPON_HATCHET',
  'WEAPON_KNUCKLE',
  'WEAPON_FIREWORK',
  'WEAPON_MARKSMANPISTOL',
  'WEAPON_REVOLVER',
  'WEAPON_DBSHOTGUN',
  'WEAPON_BATTLEAXE',
  'WEAPON_POOLCUE',
  'WEAPON_SNSPISTOL',
  'WEAPON_COMBATPISTOL',
  'WEAPON_HEAVYPISTOL',
  'WEAPON_WRENCH');

INSERT INTO weashops (zone, item, price, license) VALUES 
    ('GunShop', 'WEAPON_POOLCUE', 200, NULL),
    ('GunShop', 'WEAPON_WRENCH', 200, NULL),
    ('GunShop', 'WEAPON_FLASHLIGHT', 250, NULL),
    ('GunShop', 'WEAPON_KNIFE', 400, NULL),
    ('GunShop', 'WEAPON_NIGHTSTICK', 400, NULL),
    ('GunShop', 'WEAPON_FIREEXTINGUISHER', 500, NULL),
    ('GunShop', 'WEAPON_BAT', 600, NULL),
    ('GunShop', 'WEAPON_HATCHET', 750, NULL),
    ('GunShop', 'WEAPON_KNUCKLE', 1000, NULL),
    ('GunShop', 'WEAPON_DAGGER', 2000, NULL),
    ('GunShop', 'WEAPON_MACHETE', 2500, NULL),
    ('GunShop', 'WEAPON_STUNGUN', 2750, NULL),
    ('GunShop', 'WEAPON_BATTLEAXE', 3000, NULL),
    ('GunShop', 'WEAPON_PISTOL', 5000, 'weapon_1'),
    ('GunShop', 'WEAPON_VINTAGEPISTOL', 7500, 'weapon_1'),
    ('GunShop', 'WEAPON_SNSPISTOL', 8000, 'weapon_1'),
    ('GunShop', 'WEAPON_COMBATPISTOL', 10000, 'weapon_1'),
    ('GunShop', 'WEAPON_HEAVYPISTOL', 15000, 'weapon_1'),
    ('GunShop', 'WEAPON_PISTOL50', 20000, 'weapon_1'),
    ('GunShop', 'WEAPON_DBSHOTGUN', 50000, 'weapon_2'),
    ('GunShop', 'WEAPON_SAWNOFFSHOTGUN', 60000, 'weapon_2'),
    ('GunShop', 'WEAPON_PUMPSHOTGUN', 70000, 'weapon_2'),
    ('GunShop', 'WEAPON_BULLPUPSHOTGUN', 80000, 'weapon_2'),
    ('GunShop', 'WEAPON_HEAVYSHOTGUN', 95000, 'weapon_2');
