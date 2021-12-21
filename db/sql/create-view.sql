CREATE VIEW myview AS
    SELECT cities.name,  weather.temp_lo, weather.temp_hi, weather.prcp, weather.date FROM weather, cities WHERE (weather.city_id = cities.id);

SELECT * FROM myview;