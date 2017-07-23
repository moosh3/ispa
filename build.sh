cd ispa && docker build -t ispa:latest -f Dockerfile . && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
docker-compose -f docker-compose.local.yml build
docker-compose build
echo Done building
