#!/bin/sh
# wait-for-mysql.sh

set -e

host="$1"
shift
cmd="$@"

echo "Waiting for MySQL at $host..."

# dùng mysql client nếu có, hoặc dùng nc (netcat)
until nc -z "$host" 3306; do
  echo "MySQL is unavailable - sleeping"
  sleep 2
done

echo "MySQL is up - executing command"
exec $cmd
