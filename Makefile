GCLOUD_PROJECT:=$(shell gcloud config list project --format="value(core.project)")
DOCKER_USER="marjoram0"
all: deploy

create-cluster:
	gcloud container clusters create ispa \
		--scope "https://www.googleapis.com/auth/userinfo.email","cloud-platform"

create-bucket:
	gsutil mb gs://$(GCLOUD_PROJECT)
    gsutil defacl set public-read gs://$(GCLOUD_PROJECT)

serve:
	docker-compose up
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
	gcloud docker push gcr.io/$(GCLOUD_PROJECT)/ispa
	docker push ${DOCKER_USER}/ispa

deploy:
	kubectl create -f ispa-app.yml

update:
	kubectl rolling-update ispa --image=gcr.io/${GCLOUD_PROJECT}/ispa

delete:
	kubectl delete deployment ispa
	kubectl delete service ispa
	gcloud container clusters delete ispa
	gcloud sql instances patch ispadb --activation-policy NEVER
