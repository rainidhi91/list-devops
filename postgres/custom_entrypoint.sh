echo "My Custom script execution starts.."

#!/bin/sh

# Before PostgreSQL can function correctly, the database cluster must be initialized:
# initdb -D /var/lib/postgres/data

#start postgres server
# /usr/bin/postgres -D /var/lib/postgres/data &

# create a user or role
psql -d postgres -c "CREATE USER u_ecommerce_fe WITH PASSWORD 'openit48*@#$';" 

# create database 
psql -d postgres -c "CREATE DATABASE ecommerce_fe OWNER 'u_ecommerce_fe';"

# DBUSER=foo
# DBUSER_PWD=
# POSTGRES_DB=
# psql -U postgres -c "CREATE USER ${DBUSER} WITH SUPERUSER CREATEDB CREATEROLE ENCRYPTED PASSWORD '${DBUSER_PWD}';" && \
# psql -U ${DBUSER} -d ${POSTGRES_DB} -c "CREATE DATABASE ${DBNAME} TEMPLATE template0;" && \
# pg_restore -v --no-owner --role=${DBUSER} --exit-on-error -U ${DBUSER} -d ${DBNAME} /tmp/pgdump.pg && \
# psql -U postgres -c "ALTER USER ${DBUSER} WITH NOSUPERUSER;" && \