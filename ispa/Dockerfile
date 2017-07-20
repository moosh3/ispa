FROM python:3.5
ENV PYTHONUNBUFFERED 1

RUN groupadd -r django \
    && useradd -r -g django django

COPY requirements/base.txt /home/docker/requirements-base.txt
COPY requirements/local.txt /home/docker/requirements-local.txt
COPY requirements/test.txt /home/docker/requirements-test.txt
COPY requirements/prod.txt /home/docker/requirements-prod.txt

RUN pip install --no-cache-dir -r /requirements/production.txt \
    && rm -rf /requirements

    COPY ./compose/django/gunicorn.sh ./compose/django/entrypoint.sh /
    RUN sed -i 's/\r//' /entrypoint.sh \
        && sed -i 's/\r//' /gunicorn.sh \
        && chmod +x /entrypoint.sh \
        && chown django /entrypoint.sh \
        && chmod +x /gunicorn.sh \
        && chown django /gunicorn.sh


COPY . /home/docker

RUN chown -R django /home/docker

USER django

WORKDIR /home/docker

CMD ["/entrypoint.sh"]
