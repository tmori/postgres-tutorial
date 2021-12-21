BEGIN;
CREATE TABLE fruit (id int, name text);
INSERT INTO fruit VALUES(1, 'banana');
INSERT INTO fruit VALUES(2, 'ringo');
INSERT INTO fruit VALUES(3, 'mikan');
SELECT * FROM fruit;

ROLLBACK;

SELECT * FROM fruit;
