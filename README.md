# ispa
Illinois Sports Business Association official website

[![Build Status](https://travis-ci.org/marjoram/ispa.svg?branch=master)](https://travis-ci.org/marjoram/ispa) [![Code Health](https://landscape.io/github/aleccunningham/ispa/master/landscape.svg?style=flat)](https://landscape.io/github/aleccunningham/ispa/master)

## Getting Started

You will also want to create a data container to make sure postgresql data is persistent, allowing you to restart the services without having to reset the database:

```Bash
$ docker volume create --name ispa_pg_data
```

For local development you'll want to bring up common services like the database, redis and ispa with docker-compose.

```Bash
$ docker-compose up --remove-orphans -d
```

**Note**: For tagged releases, the data volume most likely will have to be delete due to modifications to the migrations, possible messing up postgresql. In `data/` will be a tarball that has the newest (clean) database -- all we did was run the new migrations. Here are some commands that might be of use:

```Bash
# to backup
$ docker exec -t -u postgres ispadb pg_dumpall -c > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
# to drop db
$ docker exec -u postgres <postgres_container> psql -c 'DROP DATABASE <your_db_name>'
# to restoredocker
$ cat your_dump.sql | docker exec -i <postgres_container> psql -U postgres
```

Once you've started the container, you can access the app by going to 127.0.0.0:8000 in your browser. If you are running this in a vagrant environment, ensure you've forwarded port 8000

#### Testing

For testing, you can override the entrypoint via docker-compose but pass a command into bash from the docker run command:

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
