FROM	debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir -p /var/www/html/wordpress && \
	chown -R www-data:www-data /var/www

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
