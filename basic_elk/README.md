# BASIC ELK SETUP WITH DOCKER COMPOSE

- `cd` into this folder

- To start the ELK stack i.e, `E`lastic Container, `L`ogstash, `K`ibana, Use following command.

> ```shell
> docker-compose up [-d]
> ```
> The -d is optional and it indicates to run in detach mode.
- This command reads the docker-compose.yml file in this folder and sets up ELK stack for you.

- To check the logs for containers you can use these commands respectively
> ```shell
> docker logs elasticsearch
> ```
> ```shell
> docker logs kibana
> ```
> ```shell
> docker logs logstash
> ```

Check config folder for more insite.

- For stop the ELK stack. use the same command in this folder.
> ```shell
> docker-compose down
> ```
