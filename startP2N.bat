docker cp .\config\sav\cles-epo.txt p2n:/home/p2n/P2N-V3/ 
docker cp .\config\sav\dex.js p2n:/home/p2n/P2N-V3/ 
docker cp .\config\sav\dex.json p2n:/home/p2n/P2N-V3/ 
docker cp .\config\sav\run-all.sh p2n:/home/p2n/P2N-V3/ 
docker compose up -d
docker exec -it p2n sh -c "chmod +x /home/p2n/P2N-V3/run-all.sh && /home/p2n/P2N-V3/run-all.sh"
docker-compose logs -f p2n
