rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)
echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
sed -i -e "1iCHANGE_ME=${PASSWORD}\" coturn/coturn.env
sed -i -e "1iCHANGE_ME=${PASSWORD}\" postgresql/postgresql.env
