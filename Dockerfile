FROM ubuntu:precise

RUN apt-get -y update && apt-get -y install \
    python

COPY scripts/docker-entrypoint.sh /home/docker/docker-entrypoint.sh
COPY requirements.txt /home/docker/requirements.txt

RUN pip install -r /home/docker/requirements.txt

COPY . /home/docker/src

WORKDIR /home/docker
CMD ["/bin/bash", "docker-entrypoint.sh"]
