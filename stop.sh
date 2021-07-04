#!/bin/bash
# Read a string with spaces using for loop
for value in $(ls -d */)
do
    cd $value
    docker-compose --env-file ../.env down
    cd ..
done
