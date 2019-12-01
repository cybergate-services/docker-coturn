rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)
echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
sed '1 s/^/CHANGE_ME=${PASSWORD}\n/' coturn/coturn.env
sed '1 s/^/CHANGE_ME=${PASSWORD}\n/' postgresql/postgresql.env
