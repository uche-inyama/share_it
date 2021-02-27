#!/bin/bash

set -e

gem install bundler:2.1.4
bundle install
yarn install --check-files --frozen-lockfile

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Run the command.
exec "$@"