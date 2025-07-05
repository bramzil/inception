#!/bin/bash

set -eo pipefail

DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password.txt)

mysqladmin -u root -p$DB_ROOT_PASSWORD ping
