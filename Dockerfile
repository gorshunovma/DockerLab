FROM ubuntu:24.04

ARG User=postgres
RUN groupadd -g 1111 ${User} && useradd -u 1111 -g 1111 -d /var/lib/postgresql -s /bin/bash ${User}

RUN apt update &&apt install -y postgresql-16 mc nano &&rm -rf /var/lib/apt/lists/*

COPY ./postgresql/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

STOPSIGNAL SIGINT

#ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD [ "/usr/bin/entrypoint.sh" ] 
