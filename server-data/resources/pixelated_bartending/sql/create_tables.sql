DROP TABLE bars;
CREATE TABLE bars (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    x INT NOT NULL,
    y INT NOT NULL,
    z INT NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE bar_employees;
CREATE TABLE bar_employees (
    bar_id INT NOT NULL,
    user_id INT NOT NULL
);