FROM python:3.5
ENV PYTHONUNBUFFERED 1

COPY requirements/base.txt /home/docker/requirements-base.txt
COPY requirements/prod.txt /home/docker/requirements-prod.txt

RUN pip install --no-cache-dir -r /home/docker/requirements-base.txt\
      -r /home/docker/requirements-prod.txt

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY docker_bin/* /home/docker/bin/

COPY ispa/ /home/docker/ispa

WORKDIR /home/docker/ispa

ENTRYPOINT ["/docker-entrypoint.sh"]
