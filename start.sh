cd "web/"
echo "What would you like your server name to be?"
read NAME
sed -i "s|\${SERVERNAME}|$NAME|g" game.html
sed -i "s|\${SERVERNAME}|$NAME|g" wasm.html
npm install --global surge 
echo "What would you like your surge.sh subdomain to be? (See surge.sh docs for custom domain)"
read SUBDOMAIN
echo "What is your server address? (with port)"
read ADDRESS
sed -i "s|\${SERVERADDRESS}|ws://$ADDRESS|g" game.html
sed -i "s|\${SERVERADDRESS}|ws://$ADDRESS|g" wasm.html
surge . "$SUBDOMAIN.surge.sh"