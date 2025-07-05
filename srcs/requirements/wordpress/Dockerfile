FROM	debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends ca-certificates sudo curl \
	  php php-fpm php-mysql php-curl php-mbstring php-xml php-zip php-json && \
	rm -rf /var/lib/apt/lists/*

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir -p /var/www/html/wordpress && \
	chown -R www-data:www-data /var/www && \
	sudo -u www-data wp core download --path=/var/www/html/wordpress

RUN	mkdir /run/php && \
	chown www-data:www-data /run/php

CMD	[ "php-fpm7.4", "-F" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]
