#!/bin/bash
set -e

cd /bungee
java -Xmx1024M -Xms1024M -jar bungee.jar

cd /server
java -Xmx1024M -Xms1024M -jar paper.jar
