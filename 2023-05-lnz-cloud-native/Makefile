K8SGPT_OPERATOR_VERSION=0.0.16

.PHONY: install
install:
	helm repo add k8sgpt https://charts.k8sgpt.ai
	helm upgrade k8sgpt -n kube-system --install k8sgpt/k8sgpt-operator --version ${K8SGPT_OPERATOR_VERSION} --wait

.PHONY: install-observability
install-observability:
	make -C support/observability install
