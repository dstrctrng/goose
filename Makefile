GOOSE := $(PWD)
VAULT := $(GOOSE)/vault
BOXCAR := $(GOOSE)
AWSME := $(GOOSE)
AWSME_CLI := $(GOOSE)/vendor/projects/awsme_cli
PKG_HOME := $(GOOSE)/pkg

export GOOSE VAULT BOXCAR AWSME AWSME_CLI PKG_HOME

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
	$(PKGADD) getopt figlet coreutils

cache: pkgsrc
	$(PKGADD) squid openssh

ruby: $(PKG_HOME)/bin/bundle

$(PKG_HOME)/bin/bundle: $(PKG_HOME)/bin/ruby $(PKG_HOME)/bin/gem $(PKG_HOME)/bin/irb
	$(PKG_HOME)/bin/gem install bundler -v '~> 1.3.5'

$(PKG_HOME)/bin/ruby193:
	$(PKGADD) ruby193-base ruby193-readline

$(PKG_HOME)/bin/gem193: $(PKG_HOME)/bin/ruby193

$(PKG_HOME)/bin/ruby: $(PKG_HOME)/bin/ruby193
	ln -nfs $(shell basename $<) $@

$(PKG_HOME)/bin/gem: $(PKG_HOME)/bin/gem193
	ln -nfs $(shell basename $<) $@

$(PKG_HOME)/bin/irb: $(PKG_HOME)/bin/irb193
	ln -nfs $(shell basename $<) $@

