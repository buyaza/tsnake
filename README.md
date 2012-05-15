T-Snake
======

Installation

<!-- language:console -->

    $ sudo apt-get install apache2
    $ sudo apt-get install php5
    $ sudo apt-get install postgresql
    $ sudo apt-get install pgadmin3
    
config postgresql

<!-- language:console -->

    $ sudo passwd postgres
    $ sudo su postgres
    $ psql
      # ALTER USER postgres WITH PASSWORD 'postgres';
      # CREATE USER cakephp WITH PASSWORD 'cakephp';
      # ALTER USER cakephp CREATEDB;