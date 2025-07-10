#!/bin/bash

set -eo pipefail

log () {
	echo "$(date '+%Y-%m-%d %H:%M:%S') [ entrypoint ] $@"
}

log "setup php7.4-fpm"

if [ ! -d "/run/php"  ]; then
	mkdir /run/php
	log "create '/run/php' folder successfully"
else
	log "'/run/php' already created"
fi

"$@"
