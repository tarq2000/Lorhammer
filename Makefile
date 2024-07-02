SHELL := /bin/bash

VERSION=$(shell git describe --exact-match --tags HEAD 2> /dev/null)
COMMIT=$(shell git rev-parse HEAD)
DATE_BUILD=$(shell date +%Y-%m-%d\_%H:%M)

BIN_DIR = $(shell go env GOPATH)/bin
GOLINT = $(BIN_DIR)/golint

.PHONY: first
first: build

####################
## GO MOD
#####
vendor: ## Install dependencies using Go Modules
	go mod tidy

####################
## LINT
#####
$(GOLINT):
	go install golang.org/x/lint/golint@latest

.PHONY: lint
lint: $(GOLINT) ## Start lint
	diff -u <(echo -n) <(gofmt -s -d ./src); [ $$? -eq 0 ]
	go vet ./src/...
	diff -u <(echo -n) <(golint ./src/...); [ $$? -eq 0 ]

####################
## TEST
#####
.PHONY: test
test: vendor ## Play test with race flag
	go test -race ./src/...

.PHONY: cover
cover: vendor ## Display test coverage percent
	./resources/scripts/cover.sh -terminal

####################
## BUILD
#####
.PHONY: build
build: vendor ## Build lorhammer and orchestrator binaries
	rm -rf build
	go build -race -ldflags "-extldflags '-static' -X main.version=${VERSION} -X main.commit=${COMMIT} -X main.date=${DATE_BUILD}" -o "build/lorhammer" src/lorhammer/main.go
	go build -race -ldflags "-extldflags '-static' -X main.version=${VERSION} -X main.commit=${COMMIT} -X main.date=${DATE_BUILD}" -o "build/orchestrator" src/orchestrator/main.go

####################
## DOC
#####
.PHONY: doc
doc: ## Make doc and put minified html into public directory
	./resources/scripts/makeDoc.sh
	rm -rf doc/public
	mv doc/public_min public

.PHONY: doc-dev
doc-dev: ## Make doc, watch files and launch a lightweight http server to access
	./resources/scripts/makeDoc.sh -dev

####################
## CLEAN
#####
.PHONY: clean
clean: ## Remove vendors, previous build and doc temporary files
	rm -rf vendor
	rm -rf build
	rm -rf doc/public
	rm -rf doc/public_min
	rm -rf doc/themes
	rm -rf public

.PHONY: help
help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
