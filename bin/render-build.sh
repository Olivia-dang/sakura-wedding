#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# bundle exec rails webpacker:install
RAILS_ENV=test bundle exec rake assets:precompile
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate