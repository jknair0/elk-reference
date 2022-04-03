# Setup

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

## Kibana
Make sure you have kibana image (same as elastic search doesn't have latest tag)
```shell
docker pull kibana:8.1.2
```

Create kibana on same network as elastic search container
```shell
docker run -d --name kibana --net elastic-search-network --env "ELASTICSEARCH_HOSTS=https://elasticsearch:9200" -p 5601:5601 kibana:8.1.2 
```

## Communication Setup

For resetting all the passwords of elasticsearch before connecting with kibana
```shell
docker exec -it elasticsearch ./bin/elasticsearch-setup-passwords interactive
```

For checking if you are able to access the elasticseach instance
```shell
curl -u elastic:password https://localhost:9200 -k
```
here, `-k` means insecure via https, `elastic` is the username `password` is the password set through 
last command

Use command to get kibana token from elasticsearch container
```shell
docker exec elasticsearch ./bin/elasticsearch-create-enrollment-token --scope kibana
```

Get the verification code of kibana by running
```shell
docker exec kibana ./bin/kibana-verification-code
```