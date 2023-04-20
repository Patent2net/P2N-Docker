docker stop p2nv3
docker stop p2n-carrot
docker image rm docker.io/dreymond/patent2net:p2nv3
docker image rm docker.io/dreymond/patent2net:p2n-carrot
docker pull docker.io/dreymond/patent2net:p2nv3
docker pull docker.io/dreymond/patent2net:p2n-carrot
docker container create --name p2n-setup docker.io/dreymond/patent2net:p2nv3 
docker cp p2n-setup:/home/p2n/P2N-V3/DATA/ .
docker cp p2n-setup:/home/p2n/P2N-V3/RequestsSets/ ./config/sav/
docker cp p2n-setup:/home/p2n/P2N-V3/Patent2Net/Resources/StanNORM2.xlsx ./config/sav/
docker container stop p2n-setup
docker container rm p2n-setup