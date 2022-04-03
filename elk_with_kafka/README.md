# Docker Compose Setup

To execute the containers in the detach mode
```shell
docker-compose -f elk_kafka_compose.yaml up -d
```

To terminate all the containers
```shell
docker-compose -f elk_kafka_compose.yaml down
```

To view the list of docker containers running
```shell
docker-compose ps
```

To view the logs in tail fashion with container name
```shell
docker-compose logs kibana -f
```


## URLs

Absolute URL to create the index patterns in Kibana

http://localhost:5601/app/management/kibana/indexPatterns/create