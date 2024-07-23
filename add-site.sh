#!/bin/zsh
## 
##	Usage: add-site sitename.tld
##  boilerplate.loc.conf must exist in /etc/apache2/sites-available/
##
##  site root should be /var/www/sitename.tld
##

if [ -z "$1" ]
then 
	echo "Usage: add-site <sitename.tld>"
	echo ""
	echo "Creates a conf file /etc/apache2/sites-available/sitename.tld.conf, enables it, and then restarts apache"
	echo "Site root should be /var/www/sitename.tld"
	echo ""

else
	# create the conf
	sudo cp /etc/apache2/sites-available/boilerplate.loc.conf /etc/apache2/sites-available/$1.conf
	sudo sed -i "s/boilerplate.loc/$1/g" /etc/apache2/sites-available/$1.conf
	sudo a2ensite $1.conf

	# create self signed cert
	sudo openssl genrsa -out /etc/ssl/private/$1.key
	sudo openssl req -new -days 365 -key /etc/ssl/private/$1.key -out /etc/ssl/private/$1.csr
	sudo openssl x509 -in /etc/ssl/private/$1.csr -out /etc/ssl/certs/$1.crt -req -signkey /etc/ssl/private/$1.key -days 365 

	#backup and add to hosts file
	sudo cp /etc/hosts /etc/hosts.bak
	sudo -- sh -c "echo 127.0.0.1    $1 >> /etc/hosts" 
	sudo -- sh -c "echo 127.0.0.1    www.$1 >> /etc/hosts" 

	sudo service apache2 restart
fi
