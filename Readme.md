
<h1>Inception</h1>
<h2>Project Overview</h2>
<p>This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.</p>
<p><a href="https://miro.com/app/board/uXjVN8m2_4o=/">Miro Board</a></p>

<h2>Contents</h2>
<ul>
<li><a href="#docker">Docker</a>
<ul>
<li><a href="#general-commands">General Commands</a></li>
<li><a href="#docker-image-management">Docker Image Management</a></li>
<li><a href="#docker-network-management">Docker Network Management</a></li>
</ul>
</li>
<li><a href="#docker-compose-commands">Docker Compose Commands</a>
<ul>
<li><a href="#docker-compose-basics">Docker Compose Basics</a></li>
</ul>
</li>
<li><a href="#mariadb">MariaDB</a>
<ul>
<li><a href="#database-connection">Database Connection</a></li>
<li><a href="#database-operations">Database Operations</a></li>
<li><a href="#table-operations">Table Operations</a></li>
<li><a href="#data-operations">Data Operations</a></li>
</ul>
</li>
<li><a href="#mysql-configuration">MySQL Configuration</a></li>
<li><a href="#ftp-test">FTP Test</a></li>
<li><a href="#grafana-test">Grafana Test</a></li>
<li><a href="#redis-test">Redis Test</a></li>
<li><a href="#adminer-test">Adminer Test</a></li>
</ul>

<h2 id="docker">Docker</h2>
<h3 id="general-commands">General Commands</h3>
<pre><code>docker ps</code> - List Docker Containers</pre>
<pre><code>docker ps -a</code> - List all Docker Containers (running and stopped)</pre>
<pre><code>docker start &lt;container_id&gt;</code> - Start a Docker Container</pre>
<pre><code>docker stop &lt;container_id&gt;</code> - Stop a Docker Container</pre>

<h3 id="docker-image-management">Docker Image Management</h3>
<pre><code>docker images</code> - List Images</pre>
<pre><code>docker pull &lt;image_name&gt;</code> - Download a specific Docker image</pre>
<pre><code>docker rmi &lt;image_id&gt;</code> - Delete a specific Docker image</pre>
<pre><code>docker run &lt;image_name&gt;</code> - Run a Docker image</pre>
<p>Example:</p>
<pre><code>docker run -d \\
  -p 27017:27017 \\
  -e username=cembo \\
  -e password=1111 \\
  --network mongo-network \\
  --name mongodb \\
  mongo
</code></pre>

<h3 id="docker-network-management">Docker Network Management</h3>
<pre><code>docker network ls</code> - List Networks</pre>
<pre><code>docker network create &lt;network_name&gt;</code> - Create a New Network</pre>
<pre><code>docker network inspect &lt;network_name&gt;</code> - Show details of containers attached to a specific Docker network</pre>

<h2 id="docker-compose-commands">Docker Compose Commands</h2>
<p>Docker Compose is a tool used to define and run multi-container Docker applications. It uses a YAML file to configure the application's services and then creates and manages all necessary containers.</p>

<h3 id="docker-compose-basics">Docker Compose Basics</h3>
<h4>Docker Compose Version</h4>
<pre><code>docker-compose --version</code> - Display the version of Docker Compose installed on the system</pre>
<pre><code>docker-compose -f &lt;file_name.yml&gt;</code> - Specify the Docker Compose YAML file to use (defaults to <code>docker-compose.yml</code>)</pre>
<pre><code>docker-compose down</code> - Stop and remove containers, networks, volumes, and images created by <code>docker-compose up</code></pre>
<pre><code>docker-compose ps</code> - List all services defined in the <code>docker-compose.yml</code> file along with their status</pre>
<pre><code>docker-compose start &lt;service_name&gt;</code> - Start the specified service</pre>
<pre><code>docker-compose stop &lt;service_name&gt;</code> - Stop the specified service</pre>
<pre><code>docker-compose restart &lt;service_name&gt;</code> - Restart the specified service</pre>
<pre><code>docker-compose logs &lt;service_name&gt;</code> - Display log output from the specified service</pre>

<h2 id="mariadb">MariaDB</h2>
<h3 id="database-connection">Database Connection</h3>
<pre><code>mysql -u &lt;username&gt; -p &lt;password&gt;</code> - Connect to MariaDB with the specified username and password</pre>
<pre><code>quit</code> - Exit MariaDB</pre>

<h3 id="database-operations">Database Operations</h3>
<pre><code>show databases;</code> - Display all existing databases</pre>
<pre><code>create database &lt;database_name&gt;;</code> - Create a new database</pre>
<pre><code>drop database &lt;database_name&gt;;</code> - Drop a database</pre>
<pre><code>use &lt;database_name&gt;;</code> - Select the specified database</pre>

<h3 id="table-operations">Table Operations</h3>
<pre><code>show tables;</code> - Display all tables in the selected database</pre>
<pre><code>create table &lt;table_name&gt; (&lt;column_definitions&gt;);</code> - Create a new table</pre>
<pre><code>describe &lt;table_name&gt;;</code> - Show the structure of a table</pre>
<pre><code>alter table &lt;table_name&gt; &lt;change&gt;;</code> - Alter the structure of a table</pre>
<pre><code>drop table &lt;table_name&gt;;</code> - Drop a table</pre>

<h3 id="data-operations">Data Operations</h3>
<pre><code>insert into &lt;table_name&gt; (&lt;column_list&gt;) values (&lt;value_list&gt;);</code> - Insert new data into a table</pre>
<pre><code>select &lt;column_list&gt; from &lt;table_name&gt; [where &lt;condition&gt;];</code> - Select data from a table</pre>
<pre><code>update &lt;table_name&gt; set &lt;column_name&gt;=&lt;new_value&gt; [where &lt;condition&gt;];</code> - Update data in a table</pre>
<pre><code>delete from &lt;table_name&gt; [where &lt;condition&gt;];</code> - Delete data from a table</pre>

<p><strong>Note:</strong> This is just a summary of the commands offered by MariaDB. For more information, please refer to the <a href="https://mariadb.com/kb/en/">MariaDB documentation</a>.</p>

<h2 id="mysql-configuration">MySQL Configuration</h2>
<p>This section contains parameters that affect the MySQL server itself.</p>
<pre><code>datadir=/var/lib/mysql</code> - Specifies the directory where MySQL data is stored</pre>
<pre><code>socket=/var/run/mysqld/mysqld.sock</code> - Specifies the location of the socket file used to connect to the server</pre>
<pre><code>log_error=/var/log/mysql/error.log</code> - Specifies the location of the log file where error messages are recorded</pre>
<pre><code>port=3306</code> - Specifies the port number that the server will listen on</pre>
<pre><code>max_connections=100</code> - Specifies the maximum number of concurrent connections that are allowed</pre>
<pre><code>validate_password_policy=1</code> - Requires passwords to adhere to certain policies</pre>
<pre><code>password_hashing_algorithm=sha256</code> - Specifies the hashing algorithm used to store passwords</pre>
<pre><code>slow_query_log=/var/log/mysql/slow_query.log</code> - Specifies the location of the log file where slow queries are recorded</pre>
<pre><code>query_cache_size=64M</code> - Sets the size of the query cache to 64 megabytes</pre>
<pre><code>key_buffer_size=16M</code> - Sets the amount of memory allocated for storing indexes in memory to 16 megabytes</pre>
<pre><code>character-set-server=utf8mb4</code> - Specifies the character set used by the server as UTF-8MB4</pre>
<pre><code>collation-server=utf8mb4_general_ci</code> - Specifies the character collation as UTF-8MB4 general-sensitivity</pre>

<p>Based on this information, the server will operate as follows:</p>
<ul>
<li>The server will store data in the <code>/var/lib/mysql</code> directory.</li>
<li>The server will be accessible via the socket file located at <code>/var/run/mysqld/mysqld.sock</code>.</li>
<li>Errors will be logged to the file <code>/var/log/mysql/error.log</code>.</li>
<li>The server will listen for connections on port <code>3306</code>.</li>
<li>A maximum of <code>100</code> concurrent connections will be allowed.</li>
<li>Passwords will be hashed using the <code>sha256</code> algorithm.</li>
<li>Slow queries will be logged to the file <code>/var/log/mysql/slow_query.log</code>.</li>
<li>The server will use the UTF-8MB4 character set and general-sensitivity collation.</li>
</ul>

<h2 id="ftp-test">FTP Test</h2>
<p>FTP (File Transfer Protocol) is used to transfer files between a client and a server over a network. The command to connect to an FTP server is:</p>
<pre><code>ftp &lt;ftp-server-ip&gt;</code></pre>

<h2 id="grafana-test">Grafana Test</h2>
<p>Grafana is an open-source platform for monitoring and observability. It provides dashboards and graphs for visualizing metrics. For Grafana, use the credentials:</p>
<ul>
<li>Username: <code>admin</code></li>
<li>Password: <code>admin</code></li>
</ul>

<h2 id="redis-test">Redis Test</h2>
<p>Redis is an in-memory data structure store, used as a database, cache, and message broker. Redis test commands:</p>
<pre><code>docker exec -it redis_container_id_or_name redis-cli
PING
SET mykey "Hello"
GET mykey
</code></pre>

<h2 id="adminer-test">Adminer Test</h2>
<p>Adminer is a full-featured database management tool written in PHP. To get the IP address of the Adminer container:</p>
<pre><code>docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' adminer</code></pre>
