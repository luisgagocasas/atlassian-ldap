#!/usr/bin/env bash

source ~/../config.env

echo "- INFO: memory_limit set the value to -1 in php"
echo 'memory_limit = -1' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini

echo "- INFO: change version composer"
composer self-update --2

echo "- INFO: install wp-cli"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp && \
echo 'wp() {' >> ~/.bashrc && \
echo '/usr/local/bin/wp "$@" --allow-root' >> ~/.bashrc && \
echo '}' >> ~/.bashrc

echo "- INFO: install dotenv command"
wp package install aaemnnosttv/wp-cli-dotenv-command:^2.0 --allow-root

echo "- INFO: bedrock: install"
BEDROCK_FOLDER=/var/www/html/bedrock
if [ ! -d "$BEDROCK_FOLDER" ];
  then
    echo "- INFO: install bedrock"
    composer create-project roots/bedrock

    echo "- INFO: config .env to bedrock"
    cd bedrock
    wp dotenv set DB_NAME $DB_NAME_WORDPRESS --allow-root
    wp dotenv set DB_USER root --allow-root
    wp dotenv set DB_PASSWORD $DB_PASSWORD_WORDPRESS --allow-root
    wp dotenv set DB_HOST wordpress_mysql --allow-root
    wp dotenv set WP_HOME $PROTOCOL://wordpress.$DOMAIN --allow-root
    wp dotenv salts generate --allow-root

    echo "- INFO: set role to user www-data"
    chown www-data:www-data $BEDROCK_FOLDER/web
    chown www-data:www-data $BEDROCK_FOLDER/web/app
    chown www-data:www-data $BEDROCK_FOLDER/web/app/plugins
    chown www-data:www-data $BEDROCK_FOLDER/web/app/themes
    chown www-data:www-data $BEDROCK_FOLDER/web/app/uploads

    echo "- INFO: Add new config"
    echo -e "Config::define('FS_METHOD', 'direct'); \nConfig::define('WP_CACHE', true);" >> $BEDROCK_FOLDER/config/environments/development.php

    echo "- bedrock to install and config project!!"
  else
    echo "- bedrock had already been installed!!"
fi
