#!/bin/sh

# Fail on error
set -e

export PATH="$PATH:/root/drupal/vendor/bin"
cd drupal_repo
echo "--------- CS O'Clock -------------"
phpcs --standard=Drupal,DrupalPractice ./

if [ -n "${phpstan_level+set}" ]; then
  echo "Running phpstan at level $phpstan_level"
  phpstan analyse -l $phpstan_level ./
fi
