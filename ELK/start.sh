#!/bin/sh

if [ -d "./docker-elk" ] 
then
    echo "Starting docker-elk" 
    cat ../.env | grep ELASTIC_PASSWORD
    cd docker-elk && docker-compose --env-file ../../.env up -d
else
    echo "git cloning docker-elk"
    git clone https://github.com/deviantony/docker-elk.git
    docker volume create elasticsearch
    cp docker-compose.yml docker-elk/docker-compose.yml
    if grep -q ELASTIC_PASSWORD ../.env; then
        cat ../.env | grep ELASTIC_PASSWORD
    else
        tmpPASSWORD=`tr -cd '[:alnum:]' < /dev/urandom | fold -w31 | head -n1`
        echo "ELASTIC_PASSWORD=$tmpPASSWORD" >> ../.env
        # ./docker-elk/kibana/config/kibana.yml
        lineNum=`grep -n elasticsearch.password: ./docker-elk/kibana/config/kibana.yml | cut -d : -f 1`
        sed -i "${lineNum}s/.*/elasticsearch.password: ${tmpPASSWORD}/g" ./docker-elk/kibana/config/kibana.yml
        # ./docker-elk/logstash/config/logstash.yml
        lineNum=`grep -n xpack.monitoring.elasticsearch.password  ./docker-elk/logstash/config/logstash.yml | cut -d : -f 1`
        sed -i "${lineNum}s/.*/xpack.monitoring.elasticsearch.password: ${tmpPASSWORD}/g" ./docker-elk/logstash/config/logstash.yml
        # ./docker-elk/logstash/config/logstash.conf
        lineNum=`grep -n password ./docker-elk/logstash/pipeline/logstash.conf | cut -d : -f 1`
        sed -i "${lineNum}s/.*/        password => \"${tmpPASSWORD}\"/g" ./docker-elk/logstash/pipeline/logstash.conf 
    fi
    if grep -q ELK_VERSION ../../.env; then
        cat ../.env | grep ELK_VERSION
    else
        echo "ELK_VERSION=7.13.2" >> ../.env
    fi
    echo "Starting docker-elk" 
    cd docker-elk && docker-compose --env-file ../../.env up -d
fi
