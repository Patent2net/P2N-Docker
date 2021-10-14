DOCKER_BUILDKIT=0
export DOCKER_BUILDKIT
docker build --no-cache --tag p2n-setup config/ 
docker run -t -d --name p2n-setup -p 5000-5010:5000-5010  p2n-setup || docker start p2n-setup
# Saving stuff in P2N - DATA is protected in docker volume
mv P2N-V3/dex.json .
mv P2N-V3/dex.js .
mkdir P2N-V3/DATA
mkdir RequestsSetsSav
mkdir RequestsAutoSav
cp P2N-V3/RequestsSets/* RequestsSetsSav
cp P2N-V3/RequestsAuto/* RequestsAutoSav
rm -rf P2N-V3
docker cp p2n-setup:/home/p2n/P2N-V3 .
# wsl -d docker-desktop  sysctl -w vm.max_map_count=262144
docker container stop p2n-setup
docker container rm p2n-setup
ln -s DATA-P2N P2N-V3/DATA
cp P2N-V3/Patent2Net/templates/carrot2Data.html P2N-V3/DATA
# restore stuff
# this will really work if dex.* exists in P2N-V3 ?????
mv dex.json P2N-V3
mv dex.js P2N-V3
cp RequestsSetsSav/* P2N-V3/RequestsSets
cp RequestsAutoSav/* P2N-V3/RequestsAuto
# clean all
rm -rf RequestsSetsSav
rm -rf RequestsAutoSav
