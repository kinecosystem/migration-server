image := "kinecosystem/migration-server"
revision := $(shell git rev-parse --short HEAD)


up:
	docker-compose up -d

down:
	docker-compose down

build-image:
	cd scripts; docker build -t ${image} -f ../Dockerfile .
	docker tag ${image} ${image}:${revision}

push-image:
	docker push ${image}:${revision}

push-image-latest:
	docker push ${image}:latest
