FROM postgres
COPY test.sh /
ENTRYPOINT /bin/sh -c /docker-entrypoint.sh postgres && /custom_entrypoint.sh