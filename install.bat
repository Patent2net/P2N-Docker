docker build --no-cache --tag p2n-setup config/ 
docker run -t -d --name p2n-setup -p 5000-5010:5000-5010  p2n-setup || docker start p2n-setup
REM Saving stuff in P2N - DATA is protected in docker volume
move P2N-V3\dex.json .
move P2N-V3\dex.js .
move P2N-V3\RequestsSets .
move P2N-V3\RequestsAuto .
del /Q /F P2N-V3
docker cp p2n-setup:/home/p2n/P2N-V3 .
wsl -d docker-desktop  sysctl -w vm.max_map_count=262144
docker container stop p2n-setup
docker container rm p2n-setup
mklink DATA-P2N P2N-V3\DATA\
copy P2N-V3\Patent2Net\templates\carrot2Data.html P2N-V3\DATA
REM restore stuff
REM this will really work if dex.* exists in P2N-V3 ?????
move dex.json P2N-V3
move dex.js P2N-V3
xcopy RequestsSets\* P2N-V3\RequestsSets
xcopy RequestsAuto\* P2N-V3\RequestsAuto
REM clean all
del /Q /F RequestsSets
del /Q /F RequestsAuto
