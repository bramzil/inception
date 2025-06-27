#!/bin/bash

set -euo pipefail

log() {
	echo "$(date +'%y%m%d %H:%M:%S'): [entrypoint]: $@" ;
}

WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password.txt)

cd "/var/www/html/wordpress"

if [ ! $(sudo -u www-data wp core download &> /dev/null) ]; then 
	log "wordpress core is downloaded successfully"
else
	log "wordpress core is already downloaded"
fi

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
	sudo -u www-data wp config create \
		--dbuser=$WP_USER \
		--dbname=$WP_DATABASE_NAME \
		--dbpass=$WP_USER_PASSWORD \
		--dbhost=$WP_DATABASE_HOST \
		--path=$WP_LOCATION_PATH
	log "wordpress configured successfully!!!"
else
	log "wordpress already configured!!!"
fi

exec "$@"
