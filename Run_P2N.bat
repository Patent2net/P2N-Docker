docker network create patent2net
docker run -t -d --mount source=p2nData,target=/home/p2n --network patent2net -p 51000-51010:51000-51010 -p 20-21:20-21 -p 5000-5010:5000-5010 --privileged=true --restart=always --name p2ne p2ne:1.0 || docker start p2ne
docker exec -it p2ne vsftpd

REM #Open 20 firewall port
REM firewall-cmd --zone=public --add-port=20/tcp --permanent
REM #Open port 21 of firewall
REM firewall-cmd --zone=public --add-port=21/tcp --permanent
REM #Open 51000-51010 firewall port
REM firewall-cmd --zone=public --add-port=51000-51010/tcp --permanent
REM #Restart the firewall
REM firewall-cmd --reload
REM #View the ports where the firewall has been started
REM firewall-cmd --zone=public --list-ports
REM docker exec -d p2ne /usr/src/P2N-V3/carrot2/carrot2-4.0.4/dcs/dcs.sh --port 5000

REM starting Kibana and ES
docker run -d --mount source=volumeInd,target=/usr/share/elasticsearch/data --network=patent2net --name elasticp2n -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticp2n

docker run -d --network=patent2net --name kibana -p 5601:5601 docker.elastic.co/kibana/kibana:7.9.2

start "" "http://127.0.0.1:5000/"