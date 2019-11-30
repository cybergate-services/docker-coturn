rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)
ln coturn/coturn.env ./.env
echo "CHANGE_ME=${PASSWORD}" >> ./.env
