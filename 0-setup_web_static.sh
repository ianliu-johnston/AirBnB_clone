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
sed -i '37i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/releases/current;\n\t}' /etc/nginx/sites-available/default
sudo service nginx restart
