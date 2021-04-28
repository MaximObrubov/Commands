# Docker commands

- Super hard docker reset
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
