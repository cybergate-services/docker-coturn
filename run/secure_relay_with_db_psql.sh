#!/bin/bash -x
#
turnserver --server-name=${TURN_SERVER_FQDN} \
  --verbose \ 
  --syslog \
  --lt-cred-mech \
  --max-bps=${MAX_BPS}\
  --fingerprint \
  --relay-threads ${RELAY_THREADS} \
  --min-port=${MIN_PORT} \
  --max-port=${MAX_PORT} \
  --realm ${REALM} \
  --psql-userdb="host=postgresql dbname=coturn user=coturn password=${PSQL_DB_PASSWORD} connect_timeout=30" \
  --cert=/etc/ssl/le/cert.pem \
  --pkey=/etc/ssl/le/privkey.pem \
  --log-file=stdout \
  --cipher-list=ALL \
  --oauth \
  --cli-password=${CLI_PASSWORD} $@
