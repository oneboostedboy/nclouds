#!/bin/sh
# wait-for-postgres.sh

set -e
  
host="$1"
shift
  
until PGPASSWORD="password" psql -h postgres -U postgres -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"
flask run