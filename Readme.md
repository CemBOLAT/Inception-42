# Inception
- [Miro](https://miro.com/app/board/uXjVN8m2_4o=/)
# Project Concept
- [Docker]()
- [Mariadb](#mariadb)
- - [Conf](#conf)
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

> [!NOTE]
> This is just a summary of the commands offered by MariaDB. For more information, please refer to the MariaDB documentation: https://mariadb.com/kb/en/


## Conf
[mysqld]: This section contains parameters that affect the MySQL server itself.

- `datadir=/var/lib/mysql`: Specifies the directory where MySQL data is stored.
- `socket=/var/run/mysqld/mysqld.sock`: Specifies the location of the socket file used to connect to the server.
- `log_error=/var/log/mysql/error.log`: Specifies the location of the log file where error messages are recorded.
- `port=3306`: Specifies the port number that the server will listen on.
- `max_connections = 100`: Specifies the maximum number of concurrent connections that are allowed.
- `validate_password_policy = 1`: Requires passwords to adhere to certain policies.
- `password_hashing_algorithm = sha256`: Specifies the hashing algorithm used to store passwords.
- `slow_query_log = /var/log/mysql/slow_query.log`: Specifies the location of the log file where slow queries are recorded.
- `query_cache_size = 64M`: Sets the size of the query cache to 64 megabytes.
- `key_buffer_size = 16M`: Sets the amount of memory allocated for storing indexes in memory to 16 megabytes.
- `character-set-server = utf8mb4`: Specifies the character set used by the server as UTF-8MB4.
- `collation-server  = utf8mb4_general_ci`: Specifies the character collation as UTF-8MB4 general-sensitivity.

Based on this information, the server will operate as follows:

- The server will store data in the `/var/lib/mysql` directory.
- The server will be accessible via the socket file located at `/var/run/mysqld/mysqld.sock`.
- Errors will be logged to the file `/var/log/mysql/error.log`.
- The server will listen for connections on port `3306`.
- A maximum of `100` concurrent connections will be allowed.
- Passwords will be hashed using the `sha256` algorithm.
- Slow queries will be logged to the file `/var/log/mysql/slow_query.log`.
- The server will use the UTF-8MB4 character set and general-sensitivity collation.