FROM	debian:bullseye

RUN	apt-get update && \
	apt-get upgrade && \
	apt-get install -y --no-install-recommends php7.4-fpm php7.4-mysql && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www

COPY	./app/adminer.php /var/www/html/adminer.php

COPY	./tools/entrypoint.sh /usr/local/bin/entrypoint.sh

CMD	[ "php-fpm7.4", "-F" ]

ENTRYPOINT [ "entrypoint.sh" ] 
