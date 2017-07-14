#!/bin/bash
build:
			docker build -t ispa:latest .
			docker-compose build
			docker-compose up
