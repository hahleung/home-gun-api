#Home gun API
Coding an API (training project) serving `home-gun` Android app.

## Technologies
* Programming language: ruby 2.3.0
* Database: postgres
* Framework for HTTP requests: Sinatra

## Installation

#### Lauching containers
In separate terminal:
```
docker-machine create -d virtualbox default
eval $(docker-machine env default)
docker-compose up
```

Relaunch:
```
docker-machine status
docker-machine start
docker ps
```

Nothing in log? Run: `docker-compose up`

Ip: `docker-machine ip` (don't forget to update `.env`)

If no TLS (SSH) certificate:
```
docker-machine regenerate-certs default
```

#### Killing containers
```
docker ps -q | xargs docker kill
docker ps -q | xargs docker rm
```

#### Database operations
Running migration schema:
```
PGPASSWORD=pass bundle exec sequel -m database/migrations/ postgres://homegun@`docker-machine ip`:5431/homegun -t
```
or:
`bundle exec database/migrate`

Managing database migrations:
* create migration files in `database/migrations`
* use Sequel documentation with ruby and postgres helpers

Running trough the database:
```
docker exec -it `docker ps -q` bash
psql -Upostgres
\l
\c homegun;
\d
drop table users;
```

## Run

#### Locally
After launching your containers:
```
bin/server
```

#### Distant access
WIP

## Endpoints

WIP: Endpoints description (requirements and response)

#### Tests suite
WIP

## Troubleshooting
WIP

## Rake Tasks
To see all the available rake tasks, launch `rake -T`

