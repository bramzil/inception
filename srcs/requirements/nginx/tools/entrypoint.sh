#!/bin/bash

set -euo pipefail

openssl req -new -x509 -key /etc/ssl/private/${DOMAIN_NAME}.key.pem -out /etc/ssl/certs/${DOMAIN_NAME}.cert.pem -days 60 -subj "/CN=$DOMAIN_NAME"

"$@"
