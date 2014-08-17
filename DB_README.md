If you would like to test out my program, please use these command-lines in PSQL:

# CREATE DATABASE max_database;
# \c max_database
# CREATE TABLE trains (name varchar, id serial PRIMARY KEY);
# CREATE TABLE stations (name varchar, location varchar, id serial PRIMARY KEY);
# CREATE TABLE stops (train_id int, station_id int, miles_to_next int, position int, id serial PRIMARY KEY);
# CREATE DATABASE max_database_test WITH TEMPLATE max_database;
