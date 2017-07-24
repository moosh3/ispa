<<<<<<< HEAD
docker-compose -f docker-compose.local.yml down
cd ispa && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
docker-compose -f docker-compose.local.yml build
docker-compose -f docker-compose.local.yml up -d
docker ps
=======
docker-compose down
cd ispa && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
docker-compose build
docker-compose up -d
docker ps
>>>>>>> 545c833f37e5ce15bfa5d5fc2a01af6a04b9635f
