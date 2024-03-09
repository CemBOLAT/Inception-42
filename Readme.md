# Inception
- [Miro](https://miro.com/app/board/uXjVN8m2_4o=/)
# Project Concept
- [Docker](#docker)
- [Mariadb](#mariadb)
- - [Conf](#conf)
- [Nginx]()
- [WordPress]()

# Docker
## General Commands
- ```docker ps``` List Docker Containers
- ```docker ps -a``` List all Docker Containers (running and stopped)
- ```docker start <container_id>``` Start a Docker Container
- ```docker stop <container_id>``` Stop a Docker Container

## Docker Image Management
- ```docker images``` List Images
- ```docker pull <image_name>``` Downloads a specific Docker image.
- ```docker rmi <image_id>``` Deletes a specific Docker image.
- ```docker run <image_name>``` RUNS DOCKER IMAGE AS EXAMPLE
```
    docker run -d \
    -p 27017:27017 \
    -e username=cembo \
    -e password=1111 \
    --network mongo-network \
    --name mongodb \
    mongo
```

## Docker Network Management
- ```docker network ls``` List Networks
- ```docker network create <network_name>``` Create a New Network
- ```docker network inspect <network_name>``` Shows details of containers attached to a specific Docker network.

# Docker Compose Commands

Docker Compose is a tool used to define and run multi-container Docker applications. It uses a YAML file to configure the application's services and then creates and manages all necessary containers.

## Docker Compose Basics

### Docker Compose Version
- ```docker-compose --version``` Displays the version of Docker Compose installed on the system.
- ```docker-compose -f <file_name.yml>``` Specifies the Docker Compose YAML file to use. By default, it looks for a file named docker-compose.yml.
- ```docker-compose down``` Stops and removes containers, networks, volumes, and images created by docker-compose up.
- ```docker-compose ps``` Lists all services defined in the docker-compose.yml file along with their status.
- ```docker-compose start <service_name>``` Starts the specified service.
- ```docker-compose stop <service_name>``` Stops the specified service.
- ```docker-compose restart <service_name>``` Restarts the specified service.
- ```docker-compose logs <service_name>``` Displays log output from the specified service.




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


### FTP-TEST
ftp <ftp-server-ip>
### Grafana test
grafana için admin admin
### redis test
docker exec -it redis_container_id_or_name redis-cli
PING
SET mykey "Hello"
GET mykey
### adminer test
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' adminer