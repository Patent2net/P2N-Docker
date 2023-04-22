docker compose up -d
docker cp .\config\sav\cles-epo.txt p2nv3:/home/p2n/P2N-V3/ 
docker cp .\config\sav\dex.js p2nv3:/home/p2n/P2N-V3/ 
docker cp .\config\sav\dex.json p2nv3:/home/p2n/P2N-V3/ 
REM docker cp .\config\sav\RequestsSets p2nv3:/home/p2n/P2N-V3/
docker cp ./config/sav/StanNORM2.xlsx  p2nv3:/home/p2n/P2N-V3/Patent2Net/Resources/
REM docker cp DATA/ p2nv3:/home/p2n/P2N-V3/
docker exec -it --user root p2nv3 sh -c "/home/p2n/P2N-V3/update.sh"
docker exec -it --user root p2nv3 chown -R p2n:p2n /home/p2n/P2N-V3/
docker compose up -d
REM put the following in comment to avoid automatic update. 
docker exec -it p2nv3 sh -c "/home/p2n/P2N-V3/run-all.sh"
docker-compose logs -f p2nv3

