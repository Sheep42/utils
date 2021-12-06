# Utils

This is a dumping ground for random useful bash scripts I use in my day-to-day. 

Most are simple enough to be relatively universal, but generally only tested with Ubuntu.

### add-site

A script that creates all of the boilerplate work for setting up a local Apache2 vhost

Usage: add-site sitename.tld

boilerplate.loc.conf must exist in /etc/apache2/sites-available/

site root should be /var/www/sitename.tld


### gitinit.sh

A script that runs through the initialization steps for a new git repo

Usage: gitinit https://url.to.git/repo [/path/to/gitignore/template] ##

Sets up gitignore defaults
