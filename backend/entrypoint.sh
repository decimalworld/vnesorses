#!/bin/bash
set -e

rm -rf /app/tmp/pids/server.pid
bundle exec rails db:prepare
bundle exec rails db:seed

exec "$@"
