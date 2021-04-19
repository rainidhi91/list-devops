#!/bin/bash
set -e

echo "Creating Second DB for postgres.."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER u_list_fe WITH PASSWORD 'PHuGs84SJ9DbBdyb';
    CREATE DATABASE list_fe OWNER 'u_list_fe';
    GRANT CONNECT ON DATABASE list_fe TO u_list_fe;
    GRANT USAGE ON SCHEMA public TO u_list_fe;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO u_list_fe;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO u_list_fe;
    grant all privileges on database list_fe to u_list_fe;
EOSQL
echo "Second database is been created successfully.."

# grant all privileges on database <my_db> to <my_user>
# grant all privileges on all table in schema public to <my_user>
# grant all privileges on all relations in schema public to <my_user>