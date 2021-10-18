deploy-all: deploy-app deploy-web deploy-postgres deploy-redis 

deploy-postgres:
	kubectl apply -f k8s/postgres

deploy-redis:
	kubectl apply -f k8s/redis

deploy-app:
	kubectl apply -f k8s/drkiq-app

deploy-web:
	kubectl apply -f k8s/drkiq-web

# This section for releasing new app image
release-app:
	docker build -t mohamedelbahr/drkiq-app:latest -f Dockerfile.production .
	docker push mohamedelbahr/drkiq-app:latest
	kubectl apply -f k8s/drkiq-app

# To clean up all deployed resources
clean-all:
	kubectl delete -f k8s/drkiq-web
	kubectl delete -f k8s/drkiq-app
	kubectl delete -f k8s/postgres
	kubectl delete -f k8s/redis
