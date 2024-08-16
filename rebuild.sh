#/bin/bash

docker-compose rm -f
docker rm -f $(docker ps -a)
sudo chown -R astra:astra ./postgresql/ ./pgdata
rm -Rfv ./postgresql/data/* ./postgresql/log/*  ./postgresql/etc/* ./pgdata/*
rm -Rfv ./postgresql/data/* ./postgresql/log/ ./postgresql/etc/ ./pgdata/
