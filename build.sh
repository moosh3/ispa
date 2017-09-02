#!/bin/bash

REPO=marjoram0
IMAGE=ispa_local
GCLOUD_PROJECT=rapid-smithy-177819

docker build -t $REPO/$IMAGE:latest -f Dockerfile.local .
docker build -t gcr.io/$GCLOUD_PROJECT/ispa:latest .
