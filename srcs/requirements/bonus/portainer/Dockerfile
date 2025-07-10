FROM	debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends curl ca-certificates && \
	rm -rf /var/lib/apt/lists/*

workdir	/opt/portainer

RUN	curl -fsSL https://github.com/portainer/portainer/releases/download/2.25.1/portainer-2.25.1-linux-amd64.tar.gz -o portainer.tar.gz && \
	tar -xzvf portainer.tar.gz && \
	mv portainer /usr/local/bin/portainer && \
	chmod +x /usr/local/bin/portainer && \
	rm portainer.tar.gz

EXPOSE	9000

ENTRYPOINT [ "portainer" ]


