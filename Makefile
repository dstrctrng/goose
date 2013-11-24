GOOSE := $(PWD)
VAULT := $(GOOSE)/vault
BOXCAR := $(GOOSE)
AWSME := $(GOOSE)
AWSME_CLI := $(GOOSE)/vendor/projects/awsme_cli

export GOOSE VAULT BOXCAR AWSME AWSME_CLI

all: ready

ready: vendor/cache
	git submodule update --init --recursive
	cd vendor/projects/boxcar && $(MAKE)
	cd vendor/projects/offline && $(MAKE)
	cd vendor/projects/awsme && $(MAKE)
	cd vendor/projects/awsme && $(MAKE) cli
	bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

vendor/cache:
	bundle --path vendor/bundle
	bundle cache

foreman:
	bundle exec foreman start
