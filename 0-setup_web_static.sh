#!/usr/bin/env bash
# Sets up nginx
sudo apt-get update && sudo apt-get install -y nginx
WEBROOT="/data/web_static"
sudo mkdir -p $WEBROOT/{releases/test/,shared}
echo "Holberton School test page" | sudo tee $WEBROOT/releases/test/index.html
pushd $WEBROOT
sudo ln -snf releases/test/ current
popd
sudo chown -R ubuntu:ubuntu /data/
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak1
INSERT=$(grep -n "server_name" /etc/nginx/sites-available/default | cut -d ':' -f1 | head -1)
sudo sed -i "$INSERT ilocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n" /etc/nginx/sites-available/default
sudo service nginx restart
