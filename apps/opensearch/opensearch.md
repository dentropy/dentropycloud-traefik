
## Links

* [flavienbwk/opensearch-docker-compose: Dockerized cluster architecture for OpenSearch with compose.](https://github.com/flavienbwk/opensearch-docker-compose)
* [YAML files - OpenSearch documentation](https://opensearch.org/docs/latest/security-plugin/configuration/yaml/#opensearchyml)
* [API - OpenSearch documentation](https://opensearch.org/docs/latest/security-plugin/access-control/api/#users)
* [YAML files - OpenSearch documentation](https://opensearch.org/docs/latest/security-plugin/configuration/yaml#internal_usersyml)
* [API - Change Password](https://opensearch.org/docs/latest/security-plugin/access-control/api/#change-password)
``` bash
docker-compose -f docker-compose-insecure.yml down
./DELETE.sh
docker-compose -f docker-compose-insecure.yml down
```

``` bash
docker-compose exec os01 bash -c "chmod +x plugins/opensearch-security/tools/securityadmin.sh && bash plugins/opensearch-security/tools/securityadmin.sh -cd plugins/opensearch-security/securityconfig -icl -nhnv -cacert config/certificates/ca/ca.pem -cert config/certificates/ca/admin.pem -key config/certificates/ca/admin.key -h localhost"
```


## Setup

``` bash
sudo sysctl -w vm.max_map_count=512000
# using sed
# cd  into apps/opensearch
mah_path=$(pwd)
cp docker-compose.yml opensearch-docker-compose
sed -i -E "s|mah_path|$mah_path|g" ./opensearch-docker-compose/docker-compose.yml
sed -i -E "s|mah_path|$mah_path|g" ./docker-compose-insecure.yml
sed -i -E "s|mah_path|$mah_path|g" ./docker-compose-secure.yml
cat ./opensearch-docker-compose/docker-compose.yml
```

``` bash
# the git cloned one
cd opensearch-docker-compose
bash ./generate-certs.sh
docker-compose up -d
docker-compose logs --follow
# Wait about 30 seconds
# press `q` to exit
docker-compose exec os01 bash -c "chmod +x plugins/opensearch-security/tools/securityadmin.sh && bash plugins/opensearch-security/tools/securityadmin.sh -cd plugins/opensearch-security/securityconfig -icl -nhnv -cacert config/certificates/ca/ca.pem -cert config/certificates/ca/admin.pem -key config/certificates/ca/admin.key -h localhost"
```

``` bash
# insecure
docker-compose -f docker-compose-insecure.yml up -d
docker-compose -f docker-compose-insecure.yml logs --follow # press `q` to quit
# secure
docker-compose -f docker-compose-secure.yml --env-file ../../.env up -d
docker-compose -f docker-compose-secure.yml logs --follow # press `q` to quit
```

## Opensearch generate password tries

``` bash
docker run -p 9200:9200 -p 9600:9600 --name ospass -e "discovery.type=single-node" opensearchproject/opensearch:1.1.0
docker exec -it ospass bash
/usr/share/opensearch/plugins/opensearch-security/tools/hash.sh -p mahPassword
docker stop ospass
docker rm ospass
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