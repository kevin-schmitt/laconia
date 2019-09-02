CONTAINER_NAME ?= my_app

start:
	docker-compose up -d 

stop:
	docker-compose stop

init:
	docker-compose up -d --build 
	docker-compose exec $(CONTAINER_NAME) /bin/cp -f docker/credentials.php config/credentials.php

install:
	docker-compose exec $(CONTAINER_NAME) composer install
	docker-compose exec $(CONTAINER_NAME) php bin/install.php	