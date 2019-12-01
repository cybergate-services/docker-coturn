#!/bin/bash
rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)

cat coturn/coturn.env >> ./.coturn.env
sed -i "s/CHANGE_ME/$PASSWORD/g" ./.coturn.env               

cat postgresql/postgresql.env >> ./.postgresql.env
sed -i "s/CHANGE_ME/$PASSWORD/g" ./.postgresql.env

cat letsencrypt/letsencrypt.env > ./.letsencrypt.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
