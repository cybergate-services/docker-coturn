#!/bin/sh
#
turnserver --server-name="${TURN_SERVER_FQDN}" \
  --verbose \ 
  --syslog \
  --lt-cred-mech  
  --max-bps=3000000 \
  --fingerprint \
  ---relay-threads 3 \
  --min-port=49152 --max-port=65535 \
  --realm ${REALM} \
  --psql-userdb="host=postgresql dbname=coturn user=coturn password=${PSQL_DB_PASSWORD} connect_timeout=30" \
  --cert=/etc/ssl/le/cert.pem --pkey=/etc/ssl/privkey.pem \
  --log-file=stdout \
  --cipher-list=ALL \
  --oauth \
  --cli-password=${CLI_PASSWORD} $@
