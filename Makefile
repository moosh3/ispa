GCLOUD_PROJECT=rapid-smithy-177819

up:
	docker-compose up -d

down:
	docker-compose down

attach:
	docker exec -it ispa_local /bin/bash

build:
	docker build -t ispa_local:latest -f Dockerfile.local .
	docker tag ispa_local aleccunningham/ispa_local:latest
	docker push aleccunningham/ispa_local:latest

# Don't run the following unless your admin on GCP, please
deploy:
	docker build -t gcr.io/${GCLOUD_PROJECT}/ispa .
	gcloud docker -- push gcr.io/${GCLOUD_PROJECT}/ispa
