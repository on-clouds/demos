# Cloud Native Rejekts EU 2023 - Demo Setup

## Setup Cluster
`terraform apply`

*Connect to Cluster*
`gcloud container clusters get-credentials kceu-demo-cluster --zone us-central1-a --project thschue-demos`

*Setup Observability*
`make install-observability`

*Setup Port-Forward*
```
kubectl port-forward -n environment-readiness-service svc/environment-readiness-service 8080

open https://localhost:8080/web
```

*Add k8sgpt secret*
```
export TOKEN=<TOKEN>
kubectl create secret generic -n k8sgpt ai-backend-secret --from-literal=secret-key=${TOKEN}
```

## Demo 1
*Ensure that Cluster is in maintenance mode*
`http://localhost:8080`

*Deploy Version 1*
`make deploy-version-1`

*Inspection*
`kubectl get pods -n podtato-kubectl`

*Expected Result*
All pods are pending

*Fix*
Get out of maintainance mode

*Expected Result*
* App deployment continues

## Demo 2
*Deploy Version 2*
`make deploy-version-2`

*show telemetry*
`http://localhost:3000`

## Demo 3
*Deploy Version 2*
`make deploy-version-3`

*show pods*
`http://localhost:8889`

## Tear down cluster
`terraform destroy`