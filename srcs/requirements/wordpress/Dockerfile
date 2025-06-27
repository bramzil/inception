FROM debian:latest

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN apt update && apt install -y --no-install-recommends php php-mysqli php-fpm curl sudo ca-certificates && \
	rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress && \
	chown -R www-data:www-data /var/www && \
	cd /var/www/html/wordpress

CMD [ "php-fpm8.2", "-F" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]
