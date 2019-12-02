#!/bin/bash
rm -rf ./.env
PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
TURN_USER_SECRET=$(openssl rand -hex 16)

cat coturn/coturn.env > ./.coturn.env
sed -i -e "s/CHANGE_ME/$PASSWORD/g" ./.coturn.env
sed -i -e "s/CHANGE_MY_SECRET/$TURN_USER_SECRET/g" ./.coturn.env               

cat postgresql/postgresql.env > ./.postgresql.env
sed -i -e "s/CHANGE_ME/$PASSWORD/g" ./.postgresql.env

cat letsencrypt/letsencrypt.env > ./.letsencrypt.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
cat ./.coturn.env  >> ./.env
cat ./.postgresql.env >> ./.env
cat postgresql/postgresql.env >> ./.env
