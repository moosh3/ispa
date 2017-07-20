FROM ubuntu:xenial

COPY requirements/base.txt /home/docker/requirements-base.txt
COPY requirements/local.txt /home/docker/requirements-local.txt
COPY requirements/test.txt /home/docker/requirements-test.txt
COPY requirements/prod.txt /home/docker/requirements-prod.txt

RUN apt-get update && apt-get install -y \
        build-essential \
        python \
        python-dev \
        python-setuptools \
        python-pip

RUN easy_install pip && pip install uwsgi && mkdir /srv/logs/

RUN pip install -r /home/docker/requirements-base.txt \
    -r /home/docker/requirements-local.txt \
    -r /home/docker/requirements-test.txt \
    -r /home/docker/requirements-prod.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

COPY run_celery.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run_celery.sh

COPY . /home/docker
WORKDIR /home/docker

RUN adduser --disabled-password --gecos '' celery
CMD ["./docker-entrypoint.sh"]
