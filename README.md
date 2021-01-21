## Supported tags and respective `Dockerfile` links

**Docker file to intstall Node Js Application**
* [`node:12-alpine`, `latest` _(Dockerfile)_](https://github.com/anuraggautam77/nginx-express-Docker/blob/main/Dockerfile)

**Docker file to intstall NGINX**
* [`NGINX` _(Dockerfile)_](https://github.com/anuraggautam77/nginx-express-Docker/blob/main/nginx-conf/Dockerfile)


## Description

This [**Docker**](https://www.docker.com/) image allows you to create [**Expressjs**](https://expressjs.com/) web applications that run with [**Nginx**](http://nginx.org/en/) in a single container.

## How to use


* You should use it as a base image for other images, using this in your `Dockerfile` for NGNIX server:

```Dockerfile
FROM  nginx
COPY default.conf /etc/nginx/conf.d/default.conf
# Your Dockerfile code...
```
* On same Diretory we ahve configuration for NGINX server

 ```
 server {
        location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://webapp:9090;
    }
}
```` 
  
* You shouldn't have to clone the GitHub repo. You should use it as a base image for other images, using this in your `Dockerfile` for expressjs application:

```Dockerfile
FROM  node:12-alpine
# Your Dockerfile code...
```

* docker-compose file we have in root diretory with below code  which having two  services 
  1) webapp - refer to node/express application . Context as ```.``` means location of dockerfile
  2) nginx  - refer to NGINX server . Dockerfile location is under ```nginx-config``` folder.
 ```
version: "3.8"
services:
    webapp:
        build:
            context: .
        ports:
            - "9090:8080"
    nginx:
        restart: always
        build:
            context: ./nginx-conf
        ports:
            - "9999:80"
```

# Docker up using docker compose

* Building an image

```
$ docker-compose build
```

* Running containers

```
$ docker-compose up
```

* Stopping  containers

```
$ docker-compose down
```

## Credits

Created by [@anuraggautam77](https://www.linkedin.com/in/anuraggautam77/)

 ## Cheer me
Cheer me up with a coffee! [![React Router](https://www.buymeacoffee.com/assets/img/bmc-f-logo.svg)](https://www.buymeacoffee.com/fL0O9wW)



