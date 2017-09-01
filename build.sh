#!/bin/bash

REPO=marjoram0
IMAGE=ispa_local

docker build -t $REPO/$IMAGE:latest -f Dockerfile.local .
