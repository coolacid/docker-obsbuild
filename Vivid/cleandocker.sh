docker ps -q |xargs docker rm
docker images -q |xargs docker rmi
