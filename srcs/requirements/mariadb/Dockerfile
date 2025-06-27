FROM debian:latest

RUN	apt update -y &&  apt upgrade -y && \
	apt install mariadb-server mariadb-client --no-install-recommends -y && \
	rm -rf /var/lib/apt/lists/*
 
COPY	./tools/docker-entrypoint.sh /usr/local/bin/

CMD [ "mysqld", "--user=mysql" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]
