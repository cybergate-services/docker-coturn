#!/bin/sh
#
# This is an example how to start a TURN Server in
# secure mode with Postgres database for users
# with the long-term credentials mechanism.
#
# We start here a TURN Server listening on IPv4 address
# 127.0.0.1 and on IPv6 address ::1. We use 127.0.0.1 as
# IPv4 relay address, and we use ::1 as IPv6 relay address.
#
# Other options:
#
# 1) set bandwidth limit on client session 3000000 bytes per second (--max-bps).
# 2) use fingerprints (-f)
# 3) use 3 relay threads (-m 3)
# 4) use min UDP relay port 32355 and max UDP relay port 65535
# 5) "-r north.gov" means "use authentication realm north.gov"
# 6) --psql-userdb="host=localhost dbname=coturn user=turn password=turn connect_timeout=30" 
# means that local database "coturn" will be used, with database user "turn" and database user 
# password "turn".
# 7) "--cert=example_turn_server_cert.pem" sets the OpenSSL certificate file name. 
# 8) "--pkey=example_turn_server_pkey.pem" sets the OpenSSL private key name.
# 9) "--log-file=stdout" means that all log output will go to the stdout.
# 10) --cipher-list=ALL means that we support all OpenSSL ciphers
# 11) --oauth - support oAuth security dialog
# 12) --cli-password=secret means that cli password set to "secret"
# Other parameters (config file name, etc) are default.

turnserver --server-name="blackdow.carleon.gov" \
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
