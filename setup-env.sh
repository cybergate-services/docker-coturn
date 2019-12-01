rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)
echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
sed -i 's/^/CHANGE_ME=${PASSWORD}/' coturn/coturn.env
sed -i 's/^/CHANGE_ME=${PASSWORD}/' postgresql/postgresql.env
