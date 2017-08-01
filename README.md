# ispa
Illinois Sports Business Association official website

[![Build Status](https://travis-ci.org/marjoram/ispa.svg?branch=master)](https://travis-ci.org/marjoram/ispa)

## Getting Started

![Imgur](http://i.imgur.com/pmPxikr.png)

Read below for specifics, but if you'd like to get started right away, start with the `build.sh` script which runs the following commands:

```Bash
$ cd ispa && docker build -t ispa_prod:latest -f Dockerfile . && docker build -t ispa:latest -f Dockerfile.local . && cd ..
$ docker-compose build
$ docker-compose -f docker-compose.prod.yml
```

You will also want to create a data container to make sure postgresql data is persistent, allowing you to restart the services without having to reset the database:

```Bash
$ docker volume create --name ispa_pg_data
```

For local development you'll want to bring up common services like the database, redis and rabbit with docker-compose. The ispa image itself is ran separately:

```Bash
$ docker-compose up --remove-orphans -d
$ docker run -it --rm -d --network=ispaproject_default --link ispa_db --publish 8000:8000 --volume $(pwd)/ispa:/home/docker/ispa --name ispa ispa:latest
```

**Note**: For tagged releases, the data volume most likely will have to be delete due to modifications to the migrations, possible messing up postgresql. In `data/` will be a tarball that has the newest (clean) database -- all we did was run the new migrations. Here are some commands that might be of use:

```Bash
# to backup
$ docker exec -t -u postgres <postgres_container> pg_dumpall -c > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
# to drop db
$ docker exec -u postgres <postgres_container> psql -c 'DROP DATABASE <your_db_name>'
# to restoredocker
$ cat your_dump.sql | docker exec -i <postgres_container> psql -U postgres
```

Dropping the database is only recommended in dev environments.

## Wagtail

You'll have to exec into the ispa container and create a superuser for wagtail like so:

```Bash
$ docker exec -it ispa bash
root@f83c760407ea:/home/docker/ispa# ./manage.py createsuperuser
Username (leave blank to use 'root'): $USER
Email address:
Password:
Password (again):
Superuser created successfully.
```

## Docker

[Here](https://asciinema.org/a/I4RhmVynrkZj8r8UyuvO4QKzY) is a screen cast which shows the manual installation of everything from start to finish.

For local development, specify the docker-compose file as such, which creates and brings up the containers supplying common services:

```Bash
docker-compose up -d
```

Boot up the actual container using `docker run`:

```Bash
$ docker run -it --rm -d --network=ispaproject_default --link ispa_db --publish 8000:8000 --volume $(pwd)/ispa:/home/docker/ispa --name ispa ispa:latest
```

Once finished, you can access the website by going to 127.0.0.0:8000 in your browser. If you are running this in a vagrant environment, ensure you've forwarded port 8000 (and 80 if you'd like to run production)
If you would like to enter the container, exec into it:

```Bash
$ docker exec -it ispa bash
root@9b32bd049709:/home/docker/ispa#
```

Since we have a data container mounted onto a postgresql docker instance, we can run commands that will backup the contents of the container for backups, data sharing, etc.

To back up our database, create a second volume named backup. Then we want to run an ubuntu instance of which we mount our original `ispa_pg_data` volume, and export it into the other container, generating a tarball. It looks like this:

```Bash
# Create another volume
$ docker volume create --name dbbackup
$ docker run --rm --volumes-from ispa_db -v $(pwd):/backup ubuntu tar cvf /backup/backup0.tar /dbbackup
# It might return an error, but the tarball should be generated
```

In local development, Django's local runserver is replaced with ```runserver_plus```. In the same form, grab a django shell like so:

```Bash
$ docker exec -it ispa bash # hop into the container
root@e08fa21c207a:/home/docker/ispa_project# ./manage.py shell_plus
# Shell Plus Model Imports
from django.urls import reverse
from django.db.models import Avg, Case, Count, F, Max, Min, Prefetch, Q, Sum, When
from django.core.cache import cache
from django.conf import settings
from django.utils import timezone
from django.contrib.auth import get_user_model
from django.db import transaction
Python 3.5.3 (default, Jul 18 2017, 23:09:11)
Type 'copyright', 'credits' or 'license' for more information
IPython 6.1.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]:
```

That imports all models automatically for you; comes in handy. If the ispa container ever stops, you can use `docker logs ispa`, which outputs all logging information from `STDOUT`.

## Trello workflow

An overview of the workflow for using Trello

- Create cards for each individual case on the TODO list with conscise title and description
- Use a checklist when a case has small steps that must be done in order to finish larger cases
- Use appropriate Labels to quickly indentify the type of case you are working on (ex. models, issues for fixing code, etc.)
- Once a case is being worked on move related card to IN PROGRESS list
- create branches for most (if not, all) cases to merge into master after a pull request and reveiw, attached to revelant case card
- Add git commits to relevant case card for small changes on master brahch (v rare)
- Once case has been completed and commits or branches attached, move card to REVIEW list so other members can review your code
- If something was off or wrong in your code, leave card in REVIEW list and make appropriate changes
- Once all members are satisfied with completed task, only the members who did not work on task can move case from REVIEW to COMPLETED
