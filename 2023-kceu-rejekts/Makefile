# renovate: datasource=github-tags depName=jaegertracing/jaeger-operator
ARGO_NAMESPACE = argocd
PODTATO_NAMESPACE = podtato-kubectl
ARGO_SECRET = $(shell kubectl -n ${ARGO_NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)
GRAFANA_PORT_FORWARD = 3000

.PHONY: install-observability
install-observability:
	make -C support/observability install

.PHONY: port-forward-argocd
port-forward-argocd:
	@echo ""
	@echo "Open ArgoCD in your Browser: http://localhost:8080"
	@echo "CTRL-c to stop port-forward"

	@echo ""
	kubectl port-forward svc/argo-cd-argocd-server -n "$(ARGO_NAMESPACE)" 8080:443 
.PHONY: argo-get-password
argo-get-password:
	@echo $(ARGO_SECRET)

.PHONY: deploy-version-1
deploy-version-1:
	kubectl create namespace "$(PODTATO_NAMESPACE)" --dry-run=client -o yaml | kubectl apply -f -
	kubectl apply -k app/version-1

.PHONY: deploy-version-2
deploy-version-2:
	kubectl create namespace "$(PODTATO_NAMESPACE)" --dry-run=client -o yaml | kubectl apply -f -
	kubectl apply -k app/version-2

.PHONY: deploy-version-3
deploy-version-3:
	kubectl create namespace "$(PODTATO_NAMESPACE)" --dry-run=client -o yaml | kubectl apply -f -
	kubectl apply -k app/version-3

.PHONY: port-forward-grafana
port-forward-grafana:
	make -C support/observability port-forward-grafana GRAFANA_PORT_FORWARD=$(GRAFANA_PORT_FORWARD)

.PHONY: port-forward-env
port-forward-env:
	kubectl port-forward -n environment-readiness-service svc/environment-readiness-service 8888:8080

