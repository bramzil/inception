#!/bin/bash

set -eo pipefail

FTP_USER_PASSWORD=$(cat /run/secrets/ftp_user_password.txt)

log () {
	echo "$(date '+%Y-%m-%d %H:%M:%S') [ entrypoint ] $@"
}

log "setup vsftpd server!!"

if id $FTP_USER &> /dev/null; then 
	log "$FTP_USER already exist!!"
else
	useradd -m -d /var/lib/wordpress -s /bin/bash "$FTP_USER"
	echo "$FTP_USER":"$FTP_USER_PASSWORD" | chpasswd
	log "$FTP_USER created successfully!!"
fi

log "launch vsftpd server"

$@

