docker-compose down
cd ispa && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
docker-compose build
docker-compose up -d
docker ps
