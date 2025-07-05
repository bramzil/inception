FROM	debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y redis-server

ENTRYPOINT [ "redis-server" ]

HEALTHCHECK CMD redis-cli ping
