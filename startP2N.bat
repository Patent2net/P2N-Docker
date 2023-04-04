docker start p2n
docker cp .\config\sav\cles-epo.txt p2n:/home/p2n/P2N-V3/ 
docker cp .\config\sav\dex.js p2n:/home/p2n/P2N-V3/ 
docker cp .\config\sav\dex.json p2n:/home/p2n/P2N-V3/ 
docker cp .\config\sav\run-all.sh p2n:/home/p2n/P2N-V3/ 
docker cp .\config\sav\RequestsSetsSav\* p2n:/home/p2n/P2N-V3/RequestsSets/ 
docker compose up -d
REM put the following in comment to avoid automatic update. 
docker exec -it p2n sh -c "chmod +x /home/p2n/P2N-V3/run-all.sh && /home/p2n/P2N-V3/run-all.sh"
docker-compose logs -f p2n
