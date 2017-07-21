# ispa
Illinois Sports Business Association official website

## Getting Started

Read below for specifics, but if you'd like to get started right away, run the local.sh script:

```$ ./local.sh```

Which builds the required docker images, volumes and networks and then runs docker-compose up using the local yml file. 

## Docker

For local development, specify the docker-compose file as such:

```docker-compose -f docker-compose.local.yml up -d```

Once finished, you can access the website by going to 0.0.0.0:8000 in your browser. If you are running this in a vagrant environment, ensure you've forwarded port 8000 (and 80 if you'd like to run production)
If you would like to enter the container, exec into it:

```docker exec -it ispa bash```

Which will create a bash shell in the ispa container. The normal ```docker-compose.yml``` file and ```Dockerfile``` run production using gunicorn and nginx. Only run this in testing; deployment will come at a later date.

I've included two shell scripts that automate the building; ```local.sh``` and ```prod.sh```. Running either will build the corresponding Dockerfile and docker-compose file.
