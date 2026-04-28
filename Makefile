GITLEAKS ?= gitleaks
GITLEAKS_CONFIG ?= .gitleaks.toml
GITLEAKS_REPORT ?= gitleaks-report.json

.PHONY: test gitleaks gitleaks-staged gitleaks-report

test:
	go test ./...

gitleaks:
	$(GITLEAKS) git --redact --verbose --config $(GITLEAKS_CONFIG)

gitleaks-staged:
	$(GITLEAKS) git --pre-commit --redact --staged --verbose --config $(GITLEAKS_CONFIG)

gitleaks-report:
	$(GITLEAKS) git --redact --verbose --report-format json --report-path $(GITLEAKS_REPORT) --config $(GITLEAKS_CONFIG)
