#!/bin/sh

if [ -d "./opensearch-docker-compose" ] 
then
    echo "Starting opensearch-docker-compose" 
    cat ../../.env | grep ELASTIC_PASSWORD
    cd opensearch-docker-compose && docker-compose --env-file ../../../.env up -d
else
    echo "git cloning opensearch-docker-compose"
    git clone https://github.com/flavienbwk/opensearch-docker-compose.git
    docker volume create elasticsearch
    cp docker-compose.yml opensearch-docker-compose/docker-compose.yml
    if grep -q ELASTIC_PASSWORD ../../.env; then
        cat ../../.env | grep ELASTIC_PASSWORD
    else
        # tmpPASSWORD=`tr -cd '[:alnum:]' < /dev/urandom | fold -w31 | head -n1`
        # echo "ELASTIC_PASSWORD=$tmpPASSWORD" >> ../../.env
        # ./opensearch-docker-compose/kibana/config/kibana.yml
        # lineNum=`grep -n elasticsearch.password: ./opensearch-docker-compose/kibana/config/kibana.yml | cut -d : -f 1`
        # sed -i "${lineNum}s/.*/elasticsearch.password: ${tmpPASSWORD}/g" ./opensearch-docker-compose/kibana/config/kibana.yml
        # ./opensearch-docker-compose/logstash/config/logstash.yml
        # lineNum=`grep -n xpack.monitoring.elasticsearch.password  ./opensearch-docker-compose/logstash/config/logstash.yml | cut -d : -f 1`
        # sed -i "${lineNum}s/.*/xpack.monitoring.elasticsearch.password: ${tmpPASSWORD}/g" ./opensearch-docker-compose/logstash/config/logstash.yml
        # ./opensearch-docker-compose/logstash/config/logstash.conf
        # lineNum=`grep -n password ./opensearch-docker-compose/logstash/pipeline/logstash.conf | cut -d : -f 1`
        # sed -i "${lineNum}s/.*/        password => \"${tmpPASSWORD}\"/g" ./opensearch-docker-compose/logstash/pipeline/logstash.conf 
    fi
    if grep -q ELK_VERSION ../../.env; then
        cat ../../.env | grep ELK_VERSION
    else
        echo "ELK_VERSION=7.13.2" >> ../../.env
    fi
    echo "Starting opensearch-docker-compose" 
    cd opensearch-docker-compose && docker-compose --env-file ../../../.env up -d
fi
