#!/bin/bash
set -e

LOG_FILE="/workspace/creation_log.txt"

echo "Enter your SERVER address: " | tee -a $LOG_FILE
read -p "Enter your SERVER address: " SERVER
export SERVER

echo "custom MTOD? (y/n): " | tee -a $LOG_FILE
read -p "custom MTOD? (y/n): " USE_CUSTOM_MTOD

if [[ "$USE_CUSTOM_MTOD" == "y" || "$USE_CUSTOM_MTOD" == "Y" ]]; then
  echo "Enter your custom MTOD: " | tee -a $LOG_FILE
  read -p "Enter your custom MTOD: " MTOD
else
  MTOD="@atypicalpotato on youtube"
fi

export MTOD

echo "SERVER = $SERVER"
echo "MTOD = $MTOD"

cd /bungee || exit 1

sed -i "s/\${SERVER}/$SERVER/g" config.yml

cd plugins/EaglercraftXBungee || exit 1

sed -i "s/\${MTOD}/$MTOD/g" listeners.yml

cd /bungee

java -Xmx1024M -Xms1024M -jar bungee.jar
