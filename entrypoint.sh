#!/bin/bash
set -e

if [ ! "$1" ] || [ ! "$2"  ]; then
  echo "Usage: docker run mongodump <host> <database>."
  exit 1
fi

mongodump --quiet --host $1 --db $2 -o /tmp
cd /tmp
tar -zxcf db.tar.gz ./$1
rm -rf ./$1

echo "File /tmp/db.tar.gz created successfully!"
