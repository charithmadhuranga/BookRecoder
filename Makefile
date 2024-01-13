DOCKER_USERNAME ?= charith1994
APPLICATION_NAME ?= bookstore-api
GIT_HASH ?= $(shell git log --format="%h" -n 1)


build:
	docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} . 

push:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}

release:
	docker pull ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}
	docker tag  ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest

compose-up:
	docker compose up -d

compose-down:
	docker compose down -d

kube-up:
	kubectl apply -f ./kubernetes/api.yaml

kube-down:
	kubectl delete -f ./kubernetes/api.yaml

kube-down-all:
	kubectl delete --all

kube-port-forward:
	kubectl port-forward service/kf-api-svc 8080

kube-autoscale-up:
	kubectl apply -f ./kubernetes/autoscale.yaml

kube-autoscale-down:
	kubectl delete -f ./kubernetes/autoscale.yaml