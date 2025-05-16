#!/bin/bash
echo starting...
cd bungee

MTOD="${MTOD:-'@atypicalpotato on youtube'}"
SERVERNAME="${SERVERNAME:-Potato Server}"

sed -i 's/${SERVER}/'"$SERVER"'/g' config.yml

cd plugins
cd EaglercraftXBungee

sed -i 's/${MTOD}/'"$MTOD"'/g' listeners.yml

cd /
cd bungee
cd web

sed -i 's/${SERVERNAME}/'"$SERVERNAME"'/g' game.html
sed -i "s/\${SERVERNAME}/$SERVERNAME/g" wasm.html

cd /
cd bungee

java -Xmx1024M -Xms1024M -jar bungee.jar
