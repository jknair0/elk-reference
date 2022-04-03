# Naive Setup

## Elastic Search

Create a common network so that other services can connect to Elastic Search. eg: Kibana
```shell
docker network create elastic-search-network
```

Make sure you have elastic search image (elastic search doesn't have latest tag)
```shell
docker pull elasticsearch:8.1.2
```

Start Elasticsearch container
```shell
docker run -d --name elasticsearch --net elastic-search-network -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:8.1.2
```
<br>

**Setting up passwords**

Since the log might not be visible for us in detach mode the elastic seach is not auto generating passwords.

For setting up all the passwords manually.
```shell
docker exec -it elasticsearch ./bin/elasticsearch-setup-passwords interactive
```
For generating random passwords
```shell
docker exec -it elasticsearch ./bin/elasticsearch-setup-passwords auto
```

<br>

**Verify the connection**

For checking if you are able to access the elasticseach container
```shell
curl -u elastic:password https://localhost:9200 -k
```
here, `-k` means insecure via https, `elastic` (there are other users as well) is the username `password` is the password set in previous step.

*or* 

Find certificate location

```shell
docker exec -it elasticsearch /bin/bash -c "find /usr/share/elasticsearch -name http_ca.crt"
```

copy it to the host system
```shell
docker cp elasticsearch:/usr/share/elasticsearch/config/certs/http_ca.crt .
```

and then curl
```shell
curl --cacert http_ca.crt -u elastic https://localhost:9200
```

<br>

### Generating enrollment token for connecting with kibana

```shell
docker exec elasticsearch ./bin/elasticsearch-create-enrollment-token --scope kibana
```

## Kibana
Make sure you have kibana image (same as elastic search doesn't have latest tag)
```shell
docker pull kibana:8.1.2
```

Create kibana on same network as elastic search container
```shell
docker run -d --name kibana --net elastic-search-network -p 5601:5601 kibana:8.1.2
```

**Verification code**

Once you verity Kibana with token. You will be asked for verification code. You can get verification code using.
```shell
docker exec kibana ./bin/kibana-verification-code
```

**Check Sub Folders for more**

Licence
-------


    Copyright 2020 Jaya Krishnan Nair K

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

