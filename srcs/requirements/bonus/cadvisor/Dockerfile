FROM	debian:bullseye AS build

RUN	apt-get update && \
	apt-get upgrade && \
	apt-get install -y --no-install-recommends \
	curl git make ca-certificates build-essential

RUN	cd /tmp && \
	curl -LO https://go.dev/dl/go1.22.3.linux-amd64.tar.gz && \
	tar -C /usr/local/ -xzf go1.22.3.linux-amd64.tar.gz && \
	rm -rf go1.22.3.linux-amd64.tar.gz

RUN	cd /tmp && \
	export PATH=$PATH:/usr/local/go/bin && \	
	git clone https://github.com/google/cadvisor && \
	cd ./cadvisor && \
	make build && \
	mv _output/cadvisor /usr/local/bin/cadvisor && \
	rm -rf /tmp/cadvisor

FROM	debian:bullseye

COPY	--from=build /usr/local/bin/cadvisor /usr/local/bin/cadvisor

ENTRYPOINT [ "cadvisor" ]
