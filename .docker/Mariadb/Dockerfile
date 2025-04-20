FROM mariadb:latest

ENV MARIADB_ROOT_PASSWORD=root_pass
ENV MARIADB_DATABASE=ep
ENV MARIADB_USER=flamma
ENV MARIADB_PASSWORD=flamma_pass

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD mysqladmin ping -h localhost -u root -p$MYSQL_ROOT_PASSWORD || exit 1
