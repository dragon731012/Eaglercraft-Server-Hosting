set -e

read -p "Enter your SERVER address (e.g., localhost:25565): " SERVER
export SERVER

read -p "custom MTOD? (y/n): " USE_CUSTOM_MTOD

if [[ "$USE_CUSTOM_MTOD" == "y" || "$USE_CUSTOM_MTOD" == "Y" ]]; then
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
