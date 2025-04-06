#!/bin/bash
echo starting...
cd bungee

sed -i 's/${SERVER}/'"$SERVER"'/g' config.yml

java -Xmx1024M -Xms1024M -jar bungee.jar
