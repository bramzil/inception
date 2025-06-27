#!/bin/bash

set -euo pipefail

WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password.txt)
WP_ROOT_PASSWORD=$(cat /run/secrets/wp_root_password.txt)

log() {
	echo "$(date +'%y%m%d %H:%M:%S'): [entrypoint]: $@" ;
}

# Initialize mariadb if it is not yet.

log "Install mariadb if it is not"

mysql_install_db

# this section  for runtime unix socket directory.

if [ ! -d "/run/mysqld" ]; then
	mkdir /run/mysqld;
	chown mysql:mysql /run/mysqld
fi

# this section for setup mariadb if it not yet.

log "Start mariadb temporary for setup"

mysqld_safe --skip-network &

pid="$!"

log "wait mysql to start."

while ! mysqladmin ping; do
	sleep 1 ;
done

log "mariadb start successfully"

mysql << lim
	CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
	CREATE USER IF NOT EXISTS '$WP_USER'@'$WP_HOST' IDENTIFIED BY '$WP_USER_PASSWORD';
	GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_USER'@'$WP_HOST';
	CREATE USER IF NOT EXISTS '$WP_ROOT'@'%' IDENTIFIED BY '$WP_ROOT_PASSWORD';
	GRANT ALL PRIVILEGES ON *.* TO '$WP_ROOT'@'%';
	FLUSH PRIVILEGES;
lim

mysqladmin shutdown

wait "$pid"

log "stop mariadb server"

# now this is the time to start owr mariadb
log "Launch mariadb server"

exec "$@" 
