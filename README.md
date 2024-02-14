# Inception
- [Miro](https://miro.com/app/board/uXjVN8m2_4o=/)
# Project Concept
- [Docker]()
- [Mariadb](#mariadb)
- [Nginx]()
- [WordPress]()

# Mariadb

## Database Connection
- ```mysql -u <username> -p <password>``` Connects to MariaDB with the specified username and password.
- ```quit``` Exits MariaDB.

## Database Operations
- ```show databases;``` Displays all existing databases.
- ```create database <database_name>;``` Creates a new database.
- ```drop database <database_name>;``` Drops a database.
- ```use <database_name>;``` Selects the specified database.


## Table Operations
- ```show tables;``` Displays all tables in the selected database.
- ```create table <table_name> (<column_definitions>);``` Creates a new table.
- ```describe <table_name>;``` Shows the structure of a table.
- ```alter table <table_name> <change>;``` Alters the structure of a table.
- ```drop table <table_name>;``` Drops a table.

## Data Operations

- ```insert into <table_name> (<column_list>) values (<value_list>);``` Inserts new data into a table.
- ```select <column_list> from <table_name> [where <condition>];``` Selects data from a table.
- ```update <table_name> set <column_name>=<new_value> [where <condition>];``` Updates data in a table.
- ```delete from <table_name> [where <condition>];``` Deletes data from a table.
