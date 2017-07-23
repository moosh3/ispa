docker-compose -f docker-compose.local.yml down
cd ispa && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
docker-compose -f docker-compose.local.yml build
docker-compose -f docker-compose.local.yml up -d
docker ps
