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
