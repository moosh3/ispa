#!/bin/bash

set -ex

REPO=marjoram0
IMAGE=ispa
GCLOUD_PROJECT=rapid-smithy-177819

# ensure code is up to date
git pull upstream master
# uncomment below if not a fork
# git pull origin master

docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"

./build.sh

git add -A
git commit -m "version $version"
git tag -a $version -m "version $version"
git push
git push --tags

docker tag $REPO/$IMAGE:latest $USERNAME/$IMAGE:$version
docker tag gcr.io/$GCLOUD_PROJECT
docker push $REPO/$IMAGE:latest
docker push $REPO/$IMAGE:$version
gcloud docker -- push gcr.io/${GCLOUD_PROJECT}/ispa:$version
gcloud docker -- push gcr.io/${GCLOUD_PROJECT}/ispa:latest
