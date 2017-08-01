cd ispa && docker build -t ispa_prod:latest -f Dockerfile . && docker build -t ispa:latest -f Dockerfile.local . && cd ..
docker-compose -f docker-compose.prod.yml build
docker-compose build
