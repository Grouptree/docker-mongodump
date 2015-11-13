#!/bin/bash
set -e

if [ ! "$1" ] || [ ! "$2"  ]; then
  echo "Usage: docker run mongodump <host> <database> <args>"
  exit 1
fi

mongodump --quiet --host $1 --db $2 -o /tmp "${@:3}"
cd /tmp
mkdir -p /backups/$2
filename="`date +"%Y-%m-%d-%H-%M-%S"`.tar.gz"
tar -czf /backups/$2/$filename ./$2
rm -rf ./$2
ln -fs /backups/$2/$filename /backups/$2/latest.tar.gz
echo "Backup file $2/$filename created."
