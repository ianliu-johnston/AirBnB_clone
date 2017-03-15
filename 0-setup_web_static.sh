#!/usr/bin/env bash
# Sets up nginx
#sudo apt-get install nginx
WEBROOT="data/web_static"
if [[ ! -e "$WEBROOT/{releases/test/,shared}" ]]; then
	sudo mkdir -p $WEBROOT/{releases/test/,shared}
fi
cd $WEBROOT
echo "Holberton School test page" | sudo tee releases/test/index.html
sudo ln -sf releases/test/ current
cd -
chown -R ubuntu:ubuntu /data/
