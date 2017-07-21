cd ispa_project && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
docker-compose -f docker-compose.local.yml build
