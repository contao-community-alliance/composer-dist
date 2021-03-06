#!/bin/bash

DIR=$(dirname $0)
cd "$DIR"

# update composer-dist
git pull

# update dependencies
php composer.phar self-update
php composer.phar install

# build archives
./console build --env prod
./console build --env dev
cp target/*.zip target/*.tar ../web/dist/

