#!/usr/bin/env bash
# Sets up nginx
#sudo apt-get install nginx
WEBROOT="data/web_static"
if [[ ! -e "$WEBROOT/{releases/test/,shared}" ]]; then
	sudo mkdir -p $WEBROOT/{releases/test/,shared}
fi
echo "Holberton School test page" | sudo tee $WEBROOT/releases/test/index.html
if [[ ! -e "$WEBROOT/releases/current" ]]; then
	cd $WEBROOT
	sudo ln -snf releases/test/ current
	cd -
fi
sudo chown -R ubuntu:ubuntu data/
