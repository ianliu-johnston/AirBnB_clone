#!/usr/bin/env bash
# Sets up nginx
#sudo apt-get install nginx
WEBROOT="data/web_static"
if [[ ! -e "$WEBROOT/{releases/test/,shared}" ]]; then
	sudo mkdir -p $WEBROOT/{releases/test/,shared}
fi
echo "Holberton School test page" | sudo tee $WEBROOT/releases/test/index.html
sudo ln -svf $WEBROOT/releases/test/ $WEBROOT/current
sudo chown -R ubuntu:ubuntu data/
