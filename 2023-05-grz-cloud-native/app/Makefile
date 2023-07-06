PODTATO_NAMESPACE = podtato-kubectl


.PHONY: init
init:
	cp ./templates/manifest.yaml .

.PHONY: cleanup
cleanup:
	kubectl delete ns $(PODTATO_NAMESPACE) --ignore-not-found=true
	rm manifest.yaml

