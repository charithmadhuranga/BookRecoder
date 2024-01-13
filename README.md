## BookStore Api using Fast api

# Kubernetes deployment

`kubectl apply -f api.yaml`

If working locally, e.g. using minikube, use port forwarding to expose the service:

`kubectl port-forward service/kf-api-svc 8080`

To scale the deployment, apply a HorizontalPodAutoscaler. Either:

`kubectl apply -f autoscale.yaml`

or:

`kubectl autoscale deployment kf-api --cpu-percent=50 --min=1 --max=10`
