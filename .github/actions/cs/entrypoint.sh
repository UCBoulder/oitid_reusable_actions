#!/bin/sh

# Fail on error
set -e

cd drupal_repo
export PATH="$PATH:/root/drupal/vendor/bin"
echo "--------- CS O'Clock -------------"
phpcs --standard=Drupal,DrupalPractice ./
echo "--------- PHPSTAN O'Clock -------------"
echo "Running phpstan at level $phpstan_level"
phpstan analyse -l $phpstan_level ./
