.PHONY: all stop start build clean netplan docker download

all: stop start

stop:
	docker compose down

start: build
	docker compose up &

build:
	docker compose build --no-cache

clean: stop
	docker ps -a -q | xargs docker rm ; docker images -q | xargs docker rmi -f ; docker volume ls -q | xargs docker volume rm

netplan:
	$(MAKE) -C scripts netplan

docker:
	$(MAKE) -C scripts docker

download:
	$(MAKE) -C scripts download