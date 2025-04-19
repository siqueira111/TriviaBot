FROM postgres:latest

ENV POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=J8H7g8h \
    POSTGRES_DB=ep \
    PGPORT=5434

COPY ./init.sql /docker-entrypoint-initdb.d/init.sql

RUN chmod 444 /docker-entrypoint-initdb.d/init.sql

CMD bash -c "rm -rf /var/lib/postgresql/data/* && docker-entrypoint.sh postgres"
