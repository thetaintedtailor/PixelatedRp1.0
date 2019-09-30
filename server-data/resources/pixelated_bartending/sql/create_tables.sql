DROP TABLE bars;
CREATE TABLE bars (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE bar_employees;
CREATE TABLE bar_employees (
    bar_id INT NOT NULL,
    user_id INT NOT NULL
);