# Cloud Native Rejekts EU 2023 - Demo Setup

*Slides*: https://docs.google.com/presentation/d/1YOukPAx9BFzWN0Z2lqd1zeWHbxHk4XcZF7X7O5Yj6xc/edit#slide=id.g17166e6ed67_0_0

*Prerequisites*:
* Google Compute Engine Account

## Setup Cluster
```
cd terraform
terraform apply
```

### Connect to Cluster 
`gcloud container clusters get-credentials kceu-demo-cluster --zone us-central1-a --project <project-name>`

### Setup Observability
`make install-observability`

### Setup Port-Forward
```
kubectl port-forward -n environment-readiness-service svc/environment-readiness-service 8080

open https://localhost:8080/web
```

### Add k8sgpt secret
```
export TOKEN=<TOKEN>
kubectl create secret generic -n k8sgpt ai-backend-secret --from-literal=secret-key=${TOKEN}
```

## Demo 1
*Ensure that Cluster is in maintenance mode*
`http://localhost:8080`

### Deploy Version 1
`make deploy-version-1`

### Inspection
`kubectl get pods -n podtato-kubectl`

### Expected Result
All pods are pending

### Fix
Get out of maintainance mode

### Expected Result
* App deployment continues

## Demo 2
*Deploy Version 2*
`make deploy-version-2`

### Show Telemetry Data
`http://localhost:3000`

## Demo 3
### Deploy Version 3
`make deploy-version-3`

### Show Pods
`kubectl get pods -n podtato-kubectl`

### Expected Result
* New service gets deployed, post deployment check finishes

### Verify
`http://localhost:8889`

## Tear down cluster
`terraform destroy`