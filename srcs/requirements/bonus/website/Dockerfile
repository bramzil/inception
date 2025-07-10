FROM	debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends nginx && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
