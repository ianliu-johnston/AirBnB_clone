#!/usr/bin/env bash
# Sets up nginx
sudo apt-get update && sudo apt-get install -y nginx
WEBROOT="/data/web_static"
sudo mkdir -p $WEBROOT/{releases/test/,shared}
echo "<DOCTYPE html><head></head><body>Holberton School test page</body></html>" | sudo tee $WEBROOT/releases/test/index.html
pushd $WEBROOT
sudo ln -snf releases/test/ current
popd
sudo chown -R ubuntu: /data/
echo -ne "user www-data;\nworker_processes 4;\npid /run/nginx.pid;\n\nevents {\n\tworker_connections 768;\n}\n\nhttp {\n\tsendfile on;\n\ttcp_nopush on;\n\ttcp_nodelay on;\n\tkeepalive_timeout 65;\n\ttypes_hash_max_size 2048;\n\tinclude /etc/nginx/mime.types;\n\tdefault_type application/octet-stream;\n\taccess_log /var/log/nginx/access.log;\n\terror_log /var/log/nginx/error.log;\n\tgzip on;\n\tgzip_disable \"msie6\";\n\tinclude /etc/nginx/conf.d/*.conf;\n\tinclude /etc/nginx/sites-enabled/*;\n\tserver {\n\t\tlisten 80;\n\t\tlisten [::]:80 default_server ipv6only=on;\n\n\t\troot /usr/share/nginx/html;\n\t\tindex index.html index.htm;\n\t\trewrite ^/redirect_me/ http://ianxaunliu-johnston.com permanent;\n\t\tserver_name localhost;\n\t\tlocation / {\n\t\t\ttry_files $uri $uri/ =404;\n\t\t}\n\t\tlocation /hbnb_static {\n\t\t\talias /data/web_static/current;\n\t\t}\n\terror_page 404 /404.html\n}" | sudo tee /etc/nginx/nginx.conf > /dev/null 2>&1
sudo service nginx restart
