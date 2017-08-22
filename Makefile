GCLOUD_PROJECT:="ispa-176718"
DOCKER_USER="marjoram0"
all: deploy

serve:
	docker-compose up -d
	docker run -it --rm -d --network=ispaproject_default --link ispa_db --publish 8000:8000 --volume $(pwd)/ispa:/home/docker/ispa --name ispa ispa_local ./manage.py runserver_plus 0.0.0.0:8000

stop:
	docker stop ispa

debug:
	docker run -it --rm -d --network=ispaproject_default --link ispa_db --publish 8000:8000 --volume $(pwd)/ispa:/home/docker/ispa --name ispa ispa:latest /bin/bash

build:
	docker build -t ispa_local -f Dockerfile.local .
	docker build -t gcr.io/$(GCLOUD_PROJECT)/ispa .
	docker build -t marjoram0/ispa:latest .

push: build
	gcloud docker -- push gcr.io/$(GCLOUD_PROJECT)/ispa
	docker push ${DOCKER_USER}/ispa

delete:
	kubectl delete -f ispa-app.yml
	kubectl delete deployment ispa
	kubectl delete service ispa
	gcloud container clusters delete ispa
	gcloud sql instances patch ispadb --activation-policy NEVER
