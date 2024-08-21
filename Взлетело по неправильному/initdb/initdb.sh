#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER docker;
	CREATE DATABASE docker;
	GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
EOSQL

# chown postgres:postgres /var/lib/postgresql /var/log/postgresql /etc/postgresql
# if test -z "$(ls -A /var/lib/postgresql/data)"; then
#     su postgres -c "psql -c \"CREATE DATABASE $POSTGRES_DB;\""
# 	su postgres -c "psql -c \"CREATE USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_PASSWORD';            
#             CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';
#             GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;
#             ALTER DATABASE $POSTGRES_DB OWNER TO $POSTGRES_USER;\""
# else


