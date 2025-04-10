#!/bin/sh
set -e

# Check if all required gems are installed; install them if not
bundle check || bundle install

# Run pending migrations
bundle exec rails db:migrate

# Hand off to whatever command was passed (e.g. rails server, sidekiq)
exec "$@"