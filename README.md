# ispa
Illinois Sports Business Association official website

## Docker

```make build``` will build all required dockerfiles, including common services. That will take a bit, but once you are finished you can run ```make start_services``` to bring up the database, rabbitmq, and redis. Start the app separately via ```make start_ispa```
