# find relations
\dt

# list databases created
\l

# exit
\q

# change password for <user>
\password <user>

# create a new database
create database <database_name>;
create database django_db;
create database imdb_db;

# create a user in postgresql
create user <database_user>;

# link created database to created user
grant all on database <database_name> to "<database_user>";

# modify password for created database
alter user <database_user> password '<database_password>';

# give permission to create new databases
alter user <database_user> createdb;

# connect to a database
\c <database_name>;