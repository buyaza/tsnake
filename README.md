T-Snake
=======

Installation

    $ sudo apt-get install apache2
    $ sudo apt-get install php5
    $ sudo apt-get install postgresql
    $ sudo apt-get install pgadmin3

Config apache2

    $ sudo a2enmod rewrite
    
Open file /etc/apache2/sites-enabled/000-default and change AllowOverride None to AllowOverride All

    $ sudo vim /etc/apache2/sites-enabled/000-default
    
    <Directory /var/www/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
    
    $ sudo /etc/init.d/apache2 restart
    
Config Postgresql

    $ sudo passwd postgres
    $ sudo su postgres
    $ psql
      # ALTER USER postgres WITH PASSWORD 'postgres';
      # CREATE USER cakephp WITH PASSWORD 'cakephp';
      # ALTER USER cakephp CREATEDB;

Config tsnake

    $ sudo chown user /var/www
    $ cd /var/www
    $ git clone git://github.com/Bayasgalan/tsnake.git
    $ cd tsnake
    $ chown -R www-data app/tmp

