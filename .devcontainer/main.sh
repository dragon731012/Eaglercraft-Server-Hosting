#!/bin/bash
set -e

java -Xmx1024M -Xms1024M -jar bungee.jar

java -Xmx1024M -Xms1024M -jar server.jar
