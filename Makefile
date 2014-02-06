GOOSE := $(PWD)
VAULT := $(GOOSE)/vault
BOXCAR := $(GOOSE)
AWSME := $(GOOSE)
AWSME_CLI := $(GOOSE)/vendor/projects/awsme_cli

export GOOSE VAULT BOXCAR AWSME AWSME_CLI

PKG_ID := $(shell uname -s)$(shell echo $(PKG_HOME) | tr / _)
PKG_PATH := $(VAULT)/packages/$(PKG_ID)/All
PKGADD := env PKG_PATH=$(PKG_PATH) pkg_add

.PHONY: pkgsrc

all: ready

ready:
	git submodule update --init --recursive
	cd vendor/projects/boxcar && $(MAKE)
	cd vendor/projects/offline && $(MAKE)
	cd vendor/projects/awsme && $(MAKE)
	cd vendor/projects/awsme && $(MAKE) cli
	bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

foreman:
	bundle exec foreman start

$(PKG_HOME)/bin/bmake:
	tar xvfz $(PKG_PATH)/../bootstrap.tgz -C /

pkgsrc: $(PKG_HOME)/bin/bmake
	$(PKGADD) getopt figlet coreutils runit irssi unzip bsdtar
	$(PKGADD) libxml2 libyaml

cache: pkgsrc
	$(PKGADD) squid openssh
