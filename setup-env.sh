#!/bin/bash
rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)

echo "CHANGE_ME=${PASSWORD}" > ./.cotrun.env
cat coturn/coturn.env >> ./.cotrun.env

echo "CHANGE_ME=${PASSWORD}" > ./.postgresql.env
cat postgresql/postgresql.env >> ./.postgresql.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
