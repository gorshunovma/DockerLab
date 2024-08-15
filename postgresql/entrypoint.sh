 
#!/bin/sh

function postgres_start()
{
    su postgres -c "pg_ctlcluster 16 main start"
    until pg_isready -h localhost -p 5432
    do
        echo "Waiting for PostgreSQL to start..."
        sleep 1
    done
    echo "PostgreSQL has been initialized."
}

chown 1111:1111 /var/lib/postgresql /var/log/postgresql /etc/postgresql

if su postgres -c "[ ! -d '/var/lib/postgresql/16' ]"; then

    su postgres -c "pg_createcluster 16 main"
    postgres_start
    su postgres -c "psql -c \"CREATE DATABASE zabbix;\""
    su postgres -c "psql -c \"CREATE USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_PASSWORD';
            CREATE USER zabbix WITH PASSWORD 'zabbix';
            GRANT ALL PRIVILEGES ON DATABASE zabbix TO zabbix;
            ALTER DATABASE zabbix OWNER TO zabbix;\""
else
    postgres_start
fi
echo 'PostgreSQL Starting...'
su postgres -c "tail -f /dev/null"
