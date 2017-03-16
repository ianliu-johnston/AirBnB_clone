#!/usr/bin/env bash
# Sets up nginx
sudo apt-get update > /dev/null 2>&1 && sudo apt-get install -y nginx > /dev/null 2>&1
WEBROOT="/data/web_static"
sudo mkdir -p $WEBROOT/{releases/test/,shared} > /dev/null 2>&1
echo -ne "<DOCTYPE html>\n<html lang=\"en\">\n<head>\n</head>\n<body>\nHolberton School test page\n</body>\n</html>" | sudo tee $WEBROOT/releases/test/index.html > /dev/null 2>&1
pushd $WEBROOT
sudo ln -snf releases/test/ current > /dev/null 2>&1
popd
sudo chown -R ubuntu:ubuntu /data/ > /dev/null 2>&1
echo -ne "server {\n\tlisten 80;\n\troot /usr/share/nginx/html;\n\tindex index.html index.htm;\n\trewrite ^/redirect_me/ http://ianxaunliu-johnston.com permanent;\n\tserver_name localhost;\n\tlocation / {\n\t\ttry_files \$uri \$uri/ =404;\n\t}\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n\terror_page 404 /404.html;\n}" | sudo tee /etc/nginx/sites-available/default > /dev/null 2>&1
sudo service nginx restart > /dev/null 2>&1
