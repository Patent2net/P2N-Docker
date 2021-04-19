docker network create patent2net
docker run -t -d --mount source=p2nData,target=/home/p2n --network patent2net -p 51000-51010:51000-51010 -p 20-21:20-21 -p 5000-5010:5000-5010 --privileged=true --restart=always --name p2ne p2ne:1.0 || docker start p2ne
docker exec -it p2ne vsftpd

ECHO starting Kibana and ES
docker run -d --mount source=volumeInd,target=/usr/share/elasticsearch/data --network=patent2net --name elasticp2n -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticp2n

docker run -d --network=patent2net --name kibana -p 5601:5601 -e ELASTICSEARCH_HOSTS="http://elasticp2n:9200" docker.elastic.co/kibana/kibana:7.9.2


open http://127.0.0.1:5000/