# Use official MariaDB image as base
FROM mariadb:latest

ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=ep
ENV MYSQL_USER=your_user
ENV MYSQL_PASSWORD=your_password

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD mysqladmin ping -h localhost -u root -p$MYSQL_ROOT_PASSWORD || exit 1
