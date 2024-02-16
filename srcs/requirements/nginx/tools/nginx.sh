#!/bin/bash

echo "server {"                                                 > /etc/nginx/sites-available/default;
echo "    listen 443 ssl;"                                      >> /etc/nginx/sites-available/default;
echo "    listen [::]:443 ssl;"                                 >> /etc/nginx/sites-available/default;
echo "    server_name $DOMAIN_NAME;"                            >> /etc/nginx/sites-available/default;
echo "    ssl_certificate $CERTIFICICATES_OUT;"                 >> /etc/nginx/sites-available/default;
echo "    ssl_certificate_key $CERTIFICICATES_KEYOUT;"          >> /etc/nginx/sites-available/default;
echo "    ssl_protocols TLSv1.3;"                               >> /etc/nginx/sites-available/default;
echo "    root /var/www/html;"                                  >> /etc/nginx/sites-available/default;
echo "    index index.php;"                                     >> /etc/nginx/sites-available/default;
echo "    location / {"                                         >> /etc/nginx/sites-available/default;
echo '        try_files $uri $uri/ =404;'                       >> /etc/nginx/sites-available/default;
echo "    }"                                                    >> /etc/nginx/sites-available/default;
echo "    location ~ \.php$ {"                                  >> /etc/nginx/sites-available/default;
echo "        include snippets/fastcgi-php.conf;"               >> /etc/nginx/sites-available/default;
echo "        fastcgi_pass wordpress:9000;"                     >> /etc/nginx/sites-available/default;
echo "        proxy_connect_timeout 300s;"                      >> /etc/nginx/sites-available/default;
echo "        proxy_send_timeout 300s;"                         >> /etc/nginx/sites-available/default;
echo "        proxy_read_timeout 300s;"                         >> /etc/nginx/sites-available/default;
echo "        fastcgi_send_timeout 300s;"                       >> /etc/nginx/sites-available/default;
echo "        fastcgi_read_timeout 300s;"                       >> /etc/nginx/sites-available/default;
echo "    }"                                                    >> /etc/nginx/sites-available/default;


openssl req -newkey rsa:2048 -nodes -keyout $CERTIFICICATES_KEYOUT -x509 -days 365 \
-out $CERTIFICICATES_OUT -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=$DOMAIN_NAME";

exec "$@"
