#!/bin/sh

# Fail on error
set -e

export PATH="$PATH:/root/drupal/vendor/bin"
echo "--------- CS O'Clock -------------"
phpcs --standard=Drupal,DrupalPractice ./
if [ -z ${phpstan_level+x} ]; then
  phpstan analyse -l $phpstan_level ./
fi
