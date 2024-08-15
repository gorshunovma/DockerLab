#/bin/bash
#docker image ls
# df -h
# docker image prune -f
# df -h
docker-compose rm -f
docker rm -f $(docker ps -a)
sudo chown -R astra:astra ./postgresql/ ./pgdata
rm -Rfv ./postgresql/data/* ./postgresql/log/*  ./postgresql/etc/* ./pgdata/*
rm -Rfv ./postgresql/data/* ./postgresql/log/ ./postgresql/etc/ ./pgdata/

# docker build  --platform linux/amd64 -t ubuntu24.04-postgres16:1.0 .

# #docker run --rm -ti --name db --entrypoint /bin/bash  -v $(pwd)/postgresql/data:/var/lib/postgresql -v  $(pwd)/postgresql/log:/var/log/postgresql -v $(pwd)/postgresql/etc:/etc/postgresql -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=P@ssw0rd  ubuntu24.04-postgres16:1.0

# #docker run --rm --name db -v $(pwd)/postgresql/data:/var/lib/postgresql -v  $(pwd)/postgresql/log:/var/log/postgresql -v $(pwd)/postgresql/etc:/etc/postgresql -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=P@ssw0rd  ubuntu24.04-postgres16:1.0


# docker rm -f $(docker ps -a);sudo chown -R astra:astra ./postgresql/;rm -Rfv ./postgresql/data/* ./postgresql/log/*  ./postgresql/etc/*

#docker build --platform linux/amd64 -t ubuntu24.04-postgres16:1.0 .;docker image prune -f