#!/bin/bash
set -e

rm -rf /app/tmp/pids/server.pid
bundle exec rails db:prepare

exec "$@"
