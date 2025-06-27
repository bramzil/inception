FROM debian:latest

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN apt update && apt install -y nginx openssl --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*

CMD [ "nginx", "-g", "daemon off;" ]

ENTRYPOINT [ "entrypoint.sh" ]
