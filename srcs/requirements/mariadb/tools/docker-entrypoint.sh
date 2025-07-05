#!/bin/bash

set -eo pipefail

log () {
	echo "$(date '+%Y-%m-%d %H:%M:%S') [ entrypoint ] $@"
}

DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password.txt)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password.txt)

chown -R mysql:mysql /var/lib/mysql

sudo -u mysql mysqld --skip-networking &

log "launch mariadb temoprary for setup"

log "wait mariadb to start"

while ! mysqladmin ping --silent; do
	sleep 1
done

if mysql -u root -e "quit" &> /dev/null ; then
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
	log "mariadb root's password set successfully"
else
	log "mariadb root's password set already"

fi

log "set wordpress database if it is not"

mysql -u root -p"$DB_ROOT_PASSWORD" << lim
	CREATE DATABASE IF NOT EXISTS $WP_DATABASE;
	CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASSWORD';
	GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO '$WP_USER'@'%';
	FLUSH PRIVILEGES;
lim

mysqladmin -u root -p"$DB_ROOT_PASSWORD" shutdown

$@
