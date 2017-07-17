# ispa
Illinois Sports Business Association official website

## Docker

Build the base image:

```docker build -t ispa_base:latest -f Dockerfile.base .```

For local development, build the local image too:

```docker build -t ispa:latest-local -f Dockerfile.local .```

Then go ahead and start the common services:

```docker-compose -f docker-compose.local.yml up --build```
