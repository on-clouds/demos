# renovate: datasource=github-tags depName=jaegertracing/jaeger-operator
ARGO_NAMESPACE = argocd
ARGO_SECRET = $(shell kubectl -n ${ARGO_NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)

.PHONY: port-forward-argocd
port-forward-argocd:
	@echo ""
	@echo "Open ArgoCD in your Browser: http://localhost:8080"
	@echo "CTRL-c to stop port-forward"

	@echo ""
	kubectl port-forward svc/argocd-server -n "$(ARGO_NAMESPACE)" 8080:443

.PHONY: argo-get-password
argo-get-password:
	@echo $(ARGO_SECRET)

