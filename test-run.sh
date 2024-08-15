#/bin/bash

docker run -ti --name db --hostname db --network dbNet -v $(pwd)/postgresql/data:/var/lib/postgresql -v $(pwd)/postgresql/log:/var/log/postgresql -v $(pwd)/postgresql/etc:/etc/postgresql -v $(pwd)/postgresql/initdb:/docker-entrypoint-initdb.d/initdb -e POSTGRES_USER=zabbix -e POSTGRES_PASSWORD=zabbix -e POSTGRES_DB=zabbix postgres:16.4-alpine3.20



# services:
#   db:
#     # build:
#     #    context: .
#     #    dockerfile: Dockerfile.postgres
#     # image: ubuntu24.04-postgres16:1.0
#     image: postgres:16.4-alpine3.20
#     #image: 16.4-alpine3.20-zbx

#     container_name: db
#     #restart: always
#     networks:
#       - dbNet
#     volumes:
#       - ./postgresql/data:/var/lib/postgresql
#       - ./postgresql/log:/var/log/postgresql
#       - ./postgresql/etc:/etc/postgresql
#       - ./postgresql/initdb:/docker-entrypoint-initdb.d/initdb
#       # - ./postgresql/entrypoint.sh:/docker-entrypoint-initdb.d/entrypoint.sh
#       # - habrdb-data:/var/lib/postgresql/data

#     environment:
#       - POSTGRES_USER=zabbix
#       - POSTGRES_PASSWORD=zabbix
#       - POSTGRES_DB=zabbix