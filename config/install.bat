docker build --no-cache --tag p2n config/ 
docker run -t -d --name p2n -p 5000-5010:5000-5010  p2n || docker start p2n
docker cp p2n:/home/p2n/P2N-V3 .

