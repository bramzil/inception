#!/bin/bash

set -eo pipefail

log () {
	echo "$(date '+%Y-%m-%d %H:%M:%S') [ entrypoint ] $@"
}

WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password.txt)

WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password.txt)

if [ ! -f "$WP_PATH/wp-config.php" ] ; then
	sudo -u www-data wp config create --path=$WP_PATH --dbname=$WP_DATABASE --dbuser=$WP_USER --dbpass=$WP_USER_PASSWORD --dbhost=$WP_DATABASE_HOST
	echo "define('WP_REDIS_HOST', '$REDIS_HOST');" >> "$WP_PATH/wp-config.php"
	echo "define('WP_REDIS_PORT', 6379);" >> "$WP_PATH/wp-config.php"
	echo "define('WP_REDIS_TIMEOUT', 1);" >> "$WP_PATH/wp-config.php"
	echo "define('WP_REDIS_DATABASE', 0);" >> "$WP_PATH/wp-config.php"
else
	log "wordpress-config.php already exist!!"
fi

if sudo -u www-data wp core is-installed --path=$WP_PATH ; then
	log "wordpress core already installed!!"
else
	sudo -u www-data wp core install --url=$DOMAIN_NAME --title=$WEB_SITE_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path=$WP_PATH
fi

if sudo -u www-data wp plugin is-installed redis-cache --path=$WP_PATH ; then
	log "redis wordpress plugin already installed!!"
else
	sudo -u www-data wp plugin install redis-cache --path=$WP_PATH --activate
fi

"$@"

