# ispa
Illinois Sports Business Association official website

## Getting Started

Read below for specifics, but if you'd like to get started right away, run the local.sh script:

```$ ./local.sh```

Which builds the required docker images, volumes and networks and then runs docker-compose up using the local yml file. For reference, the contents of the script:

```Bash
$ cd ispa_project && docker build -t ispa:latest-local -f Dockerfile.local . && cd ..
$ docker-compose -f docker-compose.local.yml build
$ docker-compose -f docker-compose.local.yml up -d
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
