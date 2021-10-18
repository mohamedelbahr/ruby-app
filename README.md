# Deploy Ruby app to k8s cluster running on Minikube

## Prerequisites
You need to install below binaries to be able to comlete the task
1. kubectl > helping [document](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
3. Testing Minikube cluster > helping [document](https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-minikube/)

## Notes before deploying the app
1. The built app images were pushed to the personal public dockerhub registry
   
    1.1) mohamedelbahr/drkiq-app:latest       >> Using `Dockerfile.production`

    1.2) mohamedelbahr/drkiq-nginx:latest     >> Using `Dockerfile.nginx`
2. Database password in real production environment should be stored in a safe location and deployed as k8s secret 

## Steps
1. Clone the repo 'git clone https://github.com/mohamedelbahr/ruby-app.git'
2. Go to `ruby-app` directory
3. Before deploying the application, make sure that `kubectl` is configured to point to the installed minikube cluster by rinnung `kubectl config view`
4. Run `make deploy-all` to deploy all application stack including 
    
    A- drkiq-app

    B- drkiq-web

    C- Postgres

    D- Redis
5. Run `kubectl get pods,deploy` to verify all deployments are running
6. Run `minikube service nginx` to open a web browser page for the nginx proxy and navigate the app
7. Run `make clean-all` to clean up all created resources
