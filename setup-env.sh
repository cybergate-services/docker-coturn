#!/bin/bash
rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)

echo "CHANGE_ME=${PASSWORD}" > ./.coturn.env
cat coturn/coturn.env >> ./.coturn.env

echo "CHANGE_ME=${PASSWORD}" > ./.postgresql.env
cat postgresql/postgresql.env >> ./.postgresql.env

cat letsencrypt/letsencrypt.env > ./.letsencrypt.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
