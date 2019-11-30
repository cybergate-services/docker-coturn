rm -rf ./.env
CHANGE_ME=$(openssl rand -base64 16)
ln coturn/coturn.env ./.env
