# Home gun API
Coding an API (training project) serving `home-gun` Android app.

- [Technologies](#technologies)
- [Installation](#installation)
  - [Launching containers](#launching-containers)
  - [Killing containers](#killing-containers)
  - [Database operations](#database-operations)
- [Run](#run)
  - [Locally](#locally)
  - [Distant access](#distant-access)
- [Endpoints](#endpoints)
- [Tests Suite](#tests-suite)
- [Troubleshooting](#troubleshooting)

## Technologies

* Programming language: `ruby 2.3.0`
* Software development platform: `docker`
* Database: `postgres`
* Framework for HTTP requests: `sinatra`

## Installation

#### Launching containers
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
eval $(docker-machine env default)
docker-compose up
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

- [POST /users](#post-users)
- [POST /kitchen_points](#post-kitchen-points)
- [GET /users](#get-users)
- [GET /users/:id/kitchen_points](#get-user-id-kitchen-points)

#### POST /users
Request body:
```
{ "name": "Herve" }
```

Response status: `201`

Response body:
```
{ "name": "Herve" }
```

#### POST /kitchen_points
Request body:
```
{
  "user_id": 1,
  "value": 2,
  "date": "29/09/2016"
}
```

Response status: `201`

Response body:
```
{
  "user_id": 1,
  "value": 2,
  "date": "29/09/2016"
}
```

#### GET /users
Response status: `200`

Response body:
```
{
  "users": [
    {
      "id": 1,
      "name": "Herve",
      "kitchen_points": 10,
      "kitchen_points_url": /users/1/kitchen_points"
    },
    {
      "id": 2,
      "name": "Thomas",
      "kitchen_points": 15,
      "kitchen_points_url": /users/2/kitchen_points"
    }
  ]
}
```

#### GET /users/:id/kitchen_points
Response status: `200`

Response body:
```
{
  "history": [
    {
      "points": 2,
      "date": "30/09/2016"
    },
    {
      "points": 4,
      "date": "29/09/2016"
    }
  ]
}
```
## Tests suite
WIP

## Troubleshooting
WIP
