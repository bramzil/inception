FROM	debian:bullseye

RUN	apt-get update && \
	apt-get upgrade && \
	apt-get install -y --no-install-recommends mariadb-server sudo && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir /run/mysqld && chown mysql:mysql /run/mysqld && \
	chown mysql:mysql /var/lib/mysql

CMD	[ "sudo", "-u", "mysql", "mysqld" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]

HEALTHCHECK	CMD healthcheck.sh
