#!/bin/bash

set -eo pipefail

log () {
	echo "$(date '+%Y-%m-%d %H:%M:%S') [ entrypoint ] $@"
}

WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password.txt)

WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password.txt)

if sudo -u www-data wp core is-installed --path=$WP_PATH ; then
	log "wordpress core already installed!!"
else
	sudo -u www-data wp core install --url=$DOMAIN_NAME --title=$WEB_SITE_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path=$WP_PATH
fi

if sudo -u www-data wp plugin is-installed redis-cache --path=$WP_PATH ; then
	log "redis wordpress plugin already installed!!"
else
	sudo -u www-data wp plugin install redis-cache --path=$WP_PATH --activate
	sudo -u www-data wp redis enable --path=$WP_PATH
fi

"$@"

