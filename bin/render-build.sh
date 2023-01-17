#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# bundle exec rails webpacker:install
bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rails webpacker:compile
bundle exec rake assets:clean
bundle exec rake db:migrate