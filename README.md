# ispa
Illinois Sports Business Association official website

[![Build Status](https://travis-ci.org/marjoram/ispa.svg?branch=master)](https://travis-ci.org/marjoram/ispa)

[![Codefresh build status]( https://g.codefresh.io/api/badges/build?repoOwner=marjoram&repoName=ispa&branch=master&pipelineName=ispa&accountName=aleccunningham&type=cf-1)]( https://g.codefresh.io/repositories/marjoram/ispa/builds?filter=trigger:build;branch:master;service:598a777c0c92170001750f2a~ispa)

## Getting Started

![Imgur](http://i.imgur.com/pmPxikr.png)

Read below for specifics, but if you'd like to get started right away, start with the `build.sh` script which builds all the default images and services.

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

Once you've started the container, you can access the app by going to 127.0.0.0:8000 in your browser. If you are running this in a vagrant environment, ensure you've forwarded port 8000 (and 80 if you'd like to run production).

Since that run command detaches it from the shell, you can't access it without `exec`-ing into it. With our workflow, that is not recommended. Instead, if it crashes you should run `docker logs ispa` to see the output and the error that shut down the server for debugging. Even better, when working locally, you can start the container with a bash shell; overriding the entrypoint `start-dev.sh`.

```Bash
$ docker run -it --rm -d --network=ispaproject_default --link ispa_db --publish 8000:8000 --volume $(pwd)/ispa:/home/docker/ispa --name ispa --entrypoint /bin/bash ispa:latest
# You can now attach to it
$ docker attach ispa
# You may need to type ctrl+C to exit the local bash
^C
root@419c7491c798:/home/docker/ispa# # Run ./manage.py, pytest, whatever
```

When attached to a container you can also run `./manage.py runserver_plus 0.0.0.0:8000` to start the app and access it in your browser.

Since we have a data container mounted onto a postgresql docker instance, we can run commands that will backup the contents of the container for backups, data sharing, etc.


#### Backup

There's two ways to backup the data. The easiest is to create fixtures from using `manage.py`:

```Bash
# ispa is running with a bash entrypoint
root@419c7491c798:/home/docker/ispa# ./manage.py dumpdata
# to load data, specify the fixture:
root@419c7491c798:/home/docker/ispa# ./manage.py loaddata fixtures/initial_data.json
```

To back up our postgresql database, create a second volume named backup. Then we want to run an ubuntu instance of which we mount our original `ispa_pg_data` volume, and export it into the other container, generating a tarball. It looks like this:

```Bash
# Create another volume
$ docker volume create --name dbbackup
$ docker run --rm --volumes-from ispa_db -v $(pwd):/backup ubuntu tar cvf /backup/backup0.tar /dbbackup
# It might return an error, but the tarball should be generated
```

#### Testing

For testing, you can override the entrypoint again but pass a command into bash from the docker run command:

```Bash
$ docker run -it --rm --volume $(pwd)/ispa:/home/docker/ispa --name ispa --entrypoint /bin/bash ispa:latest -c py.test --cov --verbose
# Will output the test pass/fail report from py.test
```

py.test has some awesome plugins and customizations. Here's some examples:

- run 10 slowest tests: `--duration=10`
- stop on first fail: `-x`
- drop to pdb on failure: `--pdb`
- post to pastebin: `--pastebin=failed`
- modify tracebacks: `--showlocals --tb=long`

**plugins**:

[pytest-cache](https://pythonhosted.org/pytest-cache/readme.html)
- rerun only the failed test: `--lf`
- run failed tests first: `--ff`
- clear test cache: `--clearcache`

## API

### Account and Registration endpoints

/auth//login/ POST
attributes: username, email, password
returns token

/auth//logout/ POST

/auth//password/reset/ POST
attributes: email

/auth//password/reset/confirm/ POST
attributes: uid, token, new_password1, new_password2

/auth//password/change/ POST
attributes: new_password1, new_password2, old_password

/auth//user/ GET, PUT, PATCH
attributes: username, first_name, last_name
returns pk, username, email, first_name, last_name

/auth//registration/ POST
attributes: username, password1, password2, email

/auth//registration/verify-email/ POST
attributes: key


### Event endpoints

/api/v1//events/ GET POST HEAD OPTIONS
list events

/api/v1//events/<pk>/ GET PUT PATCH DELETE HEAD OPTIONS
attributes: location, slug, event date, description, is_active, name, points, event_type

/api/v1//locations/ GET POST HEAD OPTIONS
list locations

/api/v1//users/ list, detail
read-only list of users
returns id, username, events

### Schema

REST schema: /schema
GraphQL schema: /graphql

## Front end react app

Based heavily on create-react-app by facebook. Here are the commands:

![Imgur](http://imgur.com/a/yJqDZ)


### Pages

These are static pages that will not be part of the reactapp
- home
- about_us
- our_team
- profile page
- login
- logout
- register
- sponsors

there are under the events api:
- events
  - upcoming_events
  - past_trips
  - past_speakers
    - groups of speakers

- home page
  - points system page
    - see how many points u have
    - list point values for upcoming events
    - export as csv document
    - "experience opportunities"
    - upcoming trips
      - sign up for a trip

these are under the api app:
- sign in
  - username is illinois email
- sign out
- register
- reset password


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
