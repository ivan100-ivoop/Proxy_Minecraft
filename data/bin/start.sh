#/bin/bash

chmod +x /etc/services/ngrok/*
chmod +x /etc/services/playit/*
chmod +x /usr/local/extra/*

apt update
apt install curl jq -y

SOURCE_PATH="/etc/services/ngrok/status"
LINK_PATH="/etc/services/playit/status"

if [ ! -L "$LINK_PATH" ]; then
    echo "Creating symbolic link from $SOURCE_PATH to $LINK_PATH"
    ln -s "$SOURCE_PATH" "$LINK_PATH"
fi

if [ "$proxy_type" != "none" ]; then
    proxy start
fi

/bin/bash