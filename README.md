# ispa
Illinois Sports Business Association official website

## Getting Started

Read below for specifics, but if you'd like to get started right away, start with the build.sh script:

```$ ./build.sh```

That takes care of both prod and local Dockerfiles, along with the corresponding docker-compose builds. Moving forward, you can use `local.sh` whenever you make changes that require rebuilding the local Dockerfile or the whole docker-compose services. It looks like this:

```Bash
$ cd ispa_project && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
$ docker-compose -f docker-compose.local.yml build
$ docker-compose -f docker-compose.local.yml up -d
$ docker ps
```

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

For local development, specify the docker-compose file as such:

```docker-compose -f docker-compose.local.yml up -d```

Once finished, you can access the website by going to 0.0.0.0:8000 in your browser. If you are running this in a vagrant environment, ensure you've forwarded port 8000 (and 80 if you'd like to run production)
If you would like to enter the container, exec into it:

```Bash
$ docker exec -it ispa bash
```

Which will create a bash shell in the ispa container. The normal ```docker-compose.yml``` file and ```Dockerfile``` run production using gunicorn and nginx. Only run this in testing; deployment will come at a later date.

I've included two shell scripts that automate the building; ```local.sh``` and ```prod.sh```. Running either will build the corresponding Dockerfile and docker-compose file.

In local development, Django's local runserver is replaced with ```runserver_plus```. In the same form, grab a django shell like so:

```Bash
$ docker exec -it ispa bash # hop into the container
root@e08fa21c207a:/home/docker/ispa_project# ./manage.py shell_plus
```

That imports all models automatically for you; comes in handy.

#### Building

Whenever a change in requirements is made, run the `build.sh` script to get a fresh start. It rebuilds all things docker related, but does not start anything.

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


### Event relationships

Some quick notes regarding an Event instance and its attributes, along with its FK relationships. The Event object provides `event_id`, `name`, `slug`, `date`, `description`, and `is_active` attributes. The `guests` attribute is a ManyToMany relationship to an `EventGuest` model. `location` is also defined in an Event instance with a ForeignKey to `EventLocation`. Lastly, a ForeignKey to `EventType`.

The model also comes with a custom `EventManager` that can return a query of active events and events of which the user is owner of.

The `EventGuest` model keeps track of a query of user instances tied to a particular event, along with identifying the user who created the Event in the first place. It can spit out a string with the Event's name and a guest list. Following the same ideology regarding relationship-based models, `EventLocation` stores attributes like `address`, `city`, and so on. This allows the same venue to be referenced in multiple Events.

Finally, `EventType` allows an Event owner to set codes declared in the model, allowing them to do things such as making an Event required, `EventType.REQUIRED`.
