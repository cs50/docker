#/bin/sh

# inject environment variables
# https://github.com/docker-library/php/issues/74
# since clear_env requires PHP >= 5.5.11, and we have 5.5.9
# http://php.net/manual/en/install.fpm.configuration.php
env | sed "s/\(.*\)=\(.*\)/env[\1]='\2'/" >> /etc/php5/fpm/pool.d/www.conf

# start php5-fpm
service php5-fpm start

# start nginx
nginx
