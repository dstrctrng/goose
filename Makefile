GOOSE := $(PWD)
VAULT := $(GOOSE)/vault
BOXCAR := $(GOOSE)
AWSME := $(GOOSE)
AWSME_CLI := $(GOOSE)/vendor/projects/awsme_cli
PKG_HOME := $(GOOSE)/pkg

export GOOSE VAULT BOXCAR AWSME AWSME_CLI PKG_HOME

PKG_ID := $(shell uname -s)$(shell echo $(PKG_HOME) | tr / _)
PKGADD := echo env PKG_PATH=$(VAULT)/packages/$(PKG_ID)/All pkg_add

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
