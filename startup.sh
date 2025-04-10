cd bungee
java -jar bungee.jar &
cd ..
cd server
java -jar server.jar
cd ..
sed -i 's/online-mode=true/online-mode=false/' server/server.properties
