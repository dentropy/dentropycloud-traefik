#!/bin/sh
if grep -q "AUDIOSERVE_PASSWORD" ../.env
then
    echo "Found existing password"
else
    tmpPASSWORD=`tr -cd '[:alnum:]' < /dev/urandom | fold -w31 | head -n1`
    echo "AUDIOSERVE_PASSWORD=$tmpPASSWORD" >> ../../.env
    echo "Creaing a new password"
fi
source ../../.env
echo "The password for audioserve is"
echo $AUDIOSERVE_PASSWORD
docker-compose --env-file ../../.env up -d 
