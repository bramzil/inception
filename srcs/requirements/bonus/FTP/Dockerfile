FROM	debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends vsftpd && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir -p /var/run/vsftpd/empty

EXPOSE	20 21 4000-5000 

COPY	./tools/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY	./config/vsftpd.conf /etc/vsftpd.conf

RUN	chown root:root /etc/vsftpd.conf

CMD	[ "vsftpd", "/etc/vsftpd.conf" ]

ENTRYPOINT [ "entrypoint.sh" ]
