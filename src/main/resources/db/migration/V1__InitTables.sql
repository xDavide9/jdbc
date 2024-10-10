CREATE TABLE movie (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    release_date DATE NOT NULL,
    unique (name)
);
-- the name of this file uses this convention V[number]__[description].sql
-- where that V is to specify that this is a versioned migration
-- there are also R migrations which are repeatable migrations
-- and U migrations which are undo migrations
-- never update a migration file once it's applied, always create a new one
-- this is the entire point of flyway, providing version control for your database
-- at startup flyway will run all the migrations in order of version number
-- note that V1 could for example consist of multiple files V1__part1.sql, V1__part2.sql for example
-- it uses a table called flyway_schema_history to keep track of which migrations have been run
-- in order not to rerun migration already applied
-- because it calculates the hash of the file and if it's different from the one stored
-- it gives back a checksum error
-- this allows you to build an entire history of your database schema
-- you can also use U migration where the version number must match
-- the version number of the migration you want to undo
-- this only works for the latest version of the V migration (e.g. there can't be a U2 migration if we have V3, assuming we count using natural numbers)
-- this type of migration should only be used in testing environments and not in production
-- note that U migrations are not automatically you have to manually undo the migration you
-- want to undo (e.g. to a create table in V2 corresponds a drop table in U2)
-- effectively bringing the database back to V1 using flyway cli or a plugin
-- lastly there are R migrations which are Repeatable migrations
-- what happens is that if flyway detects a change in the R migration file
-- it will rerun the migration effectively the contrary of the V migration (so it should be used with caution)

-- important note: when using spring data jpa with hibernate set ddl-auto to validate
-- this is the best way because flyway will manage the schema of the database
-- and hibernate will only make sure that our entities correctly sync the tables in the database
