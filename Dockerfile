FROM ubuntu:precise

WORKDIR /home/docker

COPY requirements/base.txt /home/docker/requirements.txt
COPY requirements/local.txt /home/docker/requirements-local.txt
COPY requirements/test.txt /home/docker/requirements-test.txt
COPY requirements/prod.txt /home/docker/requirements-prod.txt

RUN dpkg-divert --local --rename --add /sbin/initctl && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        python \
        python-dev \
        python-setuptools && \
    easy_install pip && pip install uwsgi && \
    pip install -r /home/docker/requirements.txt\
    -r /home/docker/requirements-local.txt
    -r /home/docker/requirements-test.txt
    -r /home/docker/requirements-prod.txt

COPY scripts/docker-entrypoint.sh /home/docker/docker-entrypoint.sh
RUN chmod u+x /home/docker/docker-entrypoint.sh

COPY . /home/docker/src

WORKDIR /home/docker
CMD ["/bin/bash", "docker-entrypoint.sh"]
