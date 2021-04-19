@ECHO OFF
docker container prune -f
docker image prune -a -f
docker volume prune p2nData
docker volume prune volumeInd
docker network prune
