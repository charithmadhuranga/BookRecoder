## BookStore Api using Fast api

# Build docker images

`make build`

# push images to dockerhub (with git hash as release)

`make push`

# pull,tag with latest tag and push images to dockerhub

`make release`

# Kubernetes deployment

` make kube-up`

` make kube-down`

If working locally, e.g. using minikube, use port forwarding to expose the service:

`make kube-port-forward`

To scale the deployment, apply a HorizontalPodAutoscaler. Either:

`make kube-autoscale-up`

`make kube-autoscale-down`

Delete All kubenetes resource in current namespace

`make kube-down-all`
