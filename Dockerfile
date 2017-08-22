FROM python:3.5
ENV PYTHONUNBUFFERED 1

COPY requirements/base.txt /home/docker/requirements-base.txt
COPY requirements/prod.txt /home/docker/requirements-prod.txt

WORKDIR /home/docker/ispa

RUN pip install --no-cache-dir -r /home/docker/requirements-base.txt\
      -r /home/docker/requirements-prod.txt

COPY ./ispa .
ENV DJANGO_SETTINGS_MODULE=config.settings.production

CMD gunicorn -b :8080 config.wsgi
