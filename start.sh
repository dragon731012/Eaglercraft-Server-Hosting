cp gamefiles/wasm.html web/wasm.html
cp gamefiles/game.html web/game.html
cd "web/"
echo "What would you like your server name to be?"
read NAME
sed -i "s|\${SERVERNAME}|$NAME|g" game.html
sed -i "s|\${SERVERNAME}|$NAME|g" wasm.html
npm install --global surge 
echo "Would you like to use a custom domain? Y/N (slightly more complicated)"
read C
if [[ "${C,,}" == "y" ]]; then
    echo "For this example I will be using https://freedns.afraid.org. Feel free to use your own domain if needed."
    sleep 1
    echo ""
    echo "Open your domain provider and locate the domain you would like to  use. "
    echo "On freedns, go to registry, choose a domain, and type a subdomain."
    sleep 1
    echo ""
    echo "Then, set an A Record to 45.55.110.124"
    echo "On freedns, be sure A is selected, and paste in 45.55.110.124"
    sleep 1
    echo ""
    echo "Click save, then paste your full domain down below."
    echo "On freedns, copy your full domain and paste it below." 
    echo "Do not include http/https!"
    read DOMAIN
    DOMAIN="http://$DOMAIN"
else
    echo "What would you like your surge.sh subdomain to be? (See surge.sh docs for custom domain)"
    read SUBDOMAIN
    DOMAIN="http://$SUBDOMAIN.surge.sh"
fi
echo "What is your server address? (with port)"
read ADDRESS
sed -i "s|\${SERVERADDRESS}|ws://$ADDRESS|g" game.html
sed -i "s|\${SERVERADDRESS}|ws://$ADDRESS|g" wasm.html
surge . $DOMAIN
rm game.html
rm wasm.html