CREATE TABLE `financed_vehicles` (
    `owner` varchar(22) NOT NULL,
    `plate` varchar(12) NOT NULL,
    `vehicle` varchar(20 NOT NULL,
    `purchase_price` int(11) NOT NULL,
    `payment_cost` int(6) NOT NULL,
    `remaining_balance` int(11) NOT NULL,
    `payments_behind` int(2) NOT NULL DEFAULT '0',

    PRIMARY KEY (`plate`)
);