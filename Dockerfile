FROM python:3.5
ENV PYTHONUNBUFFERED 1

COPY requirements/base.txt /home/docker/requirements-base.txt
COPY requirements/prod.txt /home/docker/requirements-prod.txt

WORKDIR /home/docker/ispa

COPY scripts/gunicorn.sh /gunicorn.sh

RUN groupadd -r django && \
      useradd -r -g django django && \
      pip install --no-cache-dir -r /home/docker/requirements-base.txt\
      -r /home/docker/requirements-prod.txt && \
    sed -i 's/\r//' /gunicorn.sh && \
    chmod +x /gunicorn.sh && \
    chown django /gunicorn.sh

COPY ./ispa .

RUN chown -R django .
USER django

CMD ["/gunicorn.sh"]
