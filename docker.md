# Docker commands

- System cleanup images
    ```docker system prune```
- Dangling volumes cleanup
    ````docker volume rm $(docker volume ls -qf dangling=true)````

- docker rebuild reset
    ```
    docker-compose rm -fsv && docker image rm %IMAGE%:latest && docker-compose up --build
    ```
- Execute docker container command
    ```
    docker exec -it %CONTAINER% %COMMAND%
    ```
for instance:
    ```
    docker exec -it %CONTAINER% psql -U postgres
    ```

 - Remove and stop containers with compose
     ```
     docker-compose rm -fsv
     ```
 - Connect to docker container TTY
    ```
    docker run -it --rm  %CONTAINER% /bin/ash
    ```
        `/bin/ash` - for Alpine
        `/bin/bash` - for Debian/Ubuntu builds
  - Get container user
      ```
        docker inspect $(docker ps -q) --format '{{.Config.User}} {{.Name}}'
      ```
