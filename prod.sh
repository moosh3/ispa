cd ispa_project && docker build -t ispa:latest . && cd ..
docker-compose -f docker-compose.prod.yml build
docker-compose -f docker-compose.prod.yml up -d
