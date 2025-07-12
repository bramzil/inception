FROM	debian:bullseye

RUN	apt-get update && \
	apt-get upgrade && \
	apt-get install -y --no-install-recommends curl ca-certificates && \
	rm -rf /var/lib/apt/lists/*

RUN	cd /tmp && \
	curl -LO https://github.com/prometheus/prometheus/releases/download/v3.5.0-rc.1/prometheus-3.5.0-rc.1.linux-amd64.tar.gz && \
	tar -C /usr/local/ -xzf prometheus-3.5.0-rc.1.linux-amd64.tar.gz && \
	rm -rf prometheus-3.5.0-rc.1.linux-amd64.tar.gz

EXPOSE	9090

WORKDIR	/usr/local/prometheus-3.5.0-rc.1.linux-amd64

ENTRYPOINT [ "./prometheus" ]
