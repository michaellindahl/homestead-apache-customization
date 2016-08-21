#!/usr/bin/env bash

apacheblock="<VirtualHost $1:${3:-80}>
    ServerName $1
    DocumentRoot $2

    <Directory "$2">
        Require all granted
    </Directory>
    
    # Possible values include: debug, info, notice, warn, error, crit, alert, emerg.
    LogLevel warn

    ErrorLog $5/$1.error.log
    CustomLog $5/$1.access.log combined
</VirtualHost>"

sudo mkdir --parents /etc/apache2/sites-available/
sudo mkdir --parents /etc/apache2/sites-enabled/

echo "$apacheblock" > "/etc/apache2/sites-available/$1.conf"
ln -fs "/etc/apache2/sites-available/$1.conf" "/etc/apache2/sites-enabled/$1.conf"

