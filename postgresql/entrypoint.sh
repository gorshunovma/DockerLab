 
#!/bin/bash

function postgres_start()
{
    sudo su postgres -c "pg_ctlcluster 16 main start"
    until pg_isready -h localhost -p 5432
    do
        echo "Waiting for PostgreSQL to start..."
        sleep 1
    done
    echo "PostgreSQL has been initialized."
}
chown 1111:1111 /var/lib/postgresql /var/log/postgresql /etc/postgresql
if test -z "$(ls -A /var/lib/postgresql)"; then
    sudo su postgres -c "pg_createcluster 16 main"
    postgres_start
    sudo su postgres -c "psql -c \"CREATE DATABASE zabbix;\""
    sudo su postgres -c "psql -c \"CREATE USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_PASSWORD';
            CREATE USER zabbix WITH PASSWORD 'zabbix';
            GRANT ALL PRIVILEGES ON DATABASE zabbix TO zabbix;
            ALTER DATABASE zabbix OWNER TO zabbix;\""
else
    postgres_start
fi
sudo su postgres -c "tail -f /dev/null"
