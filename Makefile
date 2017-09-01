GCLOUD_PROJECT=rapid-smithy-177819
TAG="(git rev-parse --short HEAD)"

up:
	docker-compose up -d

down:
	docker-compose down

attach:
	docker exec -it ispa_local /bin/bash

# Don't run the following unless your admin on GCP, please
deploy:
	docker build -t gcr.io/${GCLOUD_PROJECT}/ispa:${TAG} .
	gcloud docker -- push gcr.io/${GCLOUD_PROJECT}/ispa:${TAG}
	kubectl delete pods --all
