FROM python:3.5
ENV PYTHONUNBUFFERED 1

COPY requirements/base.txt /home/docker/requirements-base.txt
COPY requirements/prod.txt /home/docker/requirements-prod.txt

WORKDIR /home/docker/ispa

COPY gunicorn.sh /gunicorn.sh

RUN pip install --no-cache-dir -r /home/docker/requirements-base.txt\
      -r /home/docker/requirements-prod.txt && \
      chmod +x /gunicorn.sh

COPY ispa .

CMD ["/gunicorn.sh"]
