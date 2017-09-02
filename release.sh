#!/bin/bash

set -ex

GCLOUD_PROJECT=rapid-smithy-177819

# ensure code is up to date
git pull upstream master
# uncomment below if not a fork
# git pull origin master

docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"

docker build -t gcr.io/$GCLOUD_PROJECT/ispa:latest .

git add -A
git commit -m "version $version"
git tag -a $version -m "version $version"
git push
git push --tags

docker tag gcr.io/$GCLOUD_PROJECT/ispa:$version

gcloud docker -- push gcr.io/${GCLOUD_PROJECT}/ispa:$version
gcloud docker -- push gcr.io/${GCLOUD_PROJECT}/ispa:latest

kubectl delete pods --all
