#!/bin/sh

# Fail on error
set -e

export PATH="$PATH:/root/drupal/vendor/bin"
current=`pwd`
cd /root/drupal
composer update --no-interaction --ignore-platform-req=ext-gd
cd $current
cd drupal_repo
echo "--------- CS O'Clock -------------"
phpcs --standard=Drupal,DrupalPractice ./
echo "--------- PHPSTAN O'Clock -------------"
phpstan analyse -l $phpstan_level ./
