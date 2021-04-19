REM this will install ES & kibana
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.12.0
docker pull docker.elastic.co/kibana/kibana:7.12.0
docker volume create volumeInd
docker build --no-cache --tag elasticp2n .


