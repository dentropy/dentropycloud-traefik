
# Stolen from [flavienbwk/opensearch-docker-compose: Dockerized cluster architecture for OpenSearch with compose.](https://github.com/flavienbwk/opensearch-docker-compose)


## Change Password Attempt

``` bash
plugins/opensearch-security/tools/hash.sh -p <new-password>
tmpPASSWORD=`tr -cd '[:alnum:]' < /dev/urandom | fold -w31 | head -n1`
tmpHash=`docker-compose exec os01 bash -c "chmod +x plugins/opensearch-security/tools/hash.sh && bash plugins/opensearch-security/tools/hash.sh -p $tmpPASSWORD"`
echo $tmpPASSWORD
echo $tmpHash
```

## Enable HTTP

``` bash
yq eval '.volumes.os-data1.external |= false' docker-compose.yml > yq.out && mv yq.out docker-compose.yml
yq eval '.volumes.os-data2.external |= false' docker-compose.yml > yq.out && mv yq.out docker-compose.yml
yq eval '.volumes.os-data3.external |= false' docker-compose.yml > yq.out && mv yq.out docker-compose.yml
yq eval '.services.os01.environment."plugins.security.ssl.http.enabled" |= "true"' docker-compose.yml > yq.out && mv yq.out docker-compose.yml
yq eval '.services.os02.environment."plugins.security.ssl.http.enabled" |= "true"' docker-compose.yml > yq.out && mv yq.out docker-compose.yml
yq eval '.services.os03.environment."plugins.security.ssl.http.enabled" |= "true"' docker-compose.yml > yq.out && mv yq.out docker-compose.yml
```