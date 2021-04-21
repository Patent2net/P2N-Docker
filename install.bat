docker build --no-cache --tag p2n-setup config/ 
docker run -t -d --name p2n-setup -p 5000-5010:5000-5010  p2n-setup || docker start p2n-setup
docker cp p2n-setup:/home/p2n/P2N-V3 .
wsl -d docker-desktop  sysctl -w vm.max_map_count=262144
docker container stop p2n-setup
docker container rm p2n-setup
mklink DATA-P2N P2N-V3\DATA


