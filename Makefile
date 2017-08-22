GCLOUD_PROJECT:="ispa-176718"
DOCKER_USER="marjoram0"

create-bucket:
	gsutil mb gs://$(GCLOUD_PROJECT)
    gsutil defacl set public-read gs://$(GCLOUD_PROJECT)

serve:
	docker-compose up -d
	docker run -it --rm -d --network=ispaproject_default --link ispa_db --publish 8000:8000 --volume $(CURDIR)/ispa:/home/docker/ispa --name ispa ispa_local ./manage.py runserver_plus 0.0.0.0:8000

stop:
	docker stop ispa

attach:
	docker attach ispa

debug:
	docker run -it --rm -d --network=ispaproject_default --link ispa_db --publish 8000:8000 --volume $(CURDIR)/ispa:/home/docker/ispa --name ispa ispa_local /bin/bash

build:
	docker build -t ispa_local -f Dockerfile.local .
	docker build -t gcr.io/$(GCLOUD_PROJECT)/ispa .
	docker build -t marjoram0/ispa:latest .

push: build
	gcloud docker -- push gcr.io/$(GCLOUD_PROJECT)/ispa
	docker push ${DOCKER_USER}/ispa

update:
	kubectl rolling-update ispa --image=gcr.io/${GCLOUD_PROJECT}/ispa

delete:
	kubectl delete -f ispa-app.yml
	kubectl delete deployment ispa
	kubectl delete service ispa
	gcloud container clusters delete ispa
	gcloud sql instances patch ispadb --activation-policy NEVER
