#!/bin/sh
set -e

DATABASE=${PG_DATABASE:-twake}
USER=${PG_USER:-twake}
PASSWORD=${PG_PASSWORD:-twake}

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER $USER PASSWORD '$PASSWORD';
	CREATE DATABASE IF NOT EXISTS $DATABASE;
	GRANT ALL PRIVILEGES ON DATABASE $DATABASE TO $USER;
EOSQL
