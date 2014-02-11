GOOSE := $(PWD)
BOXCAR := $(GOOSE)
AWSME := $(GOOSE)
AWSME_CLI := $(GOOSE)/vendor/projects/awsme_cli

export GOOSE BOXCAR AWSME AWSME_CLI

RMAKE := unset BUNDLE_GEMFILE BUNDLE_BIN_PATH GEM_HOME GEM_PATH _ORIGINAL_GEM_PATH && $(MAKE)

all: ready

ready: config/aws.yml
	git submodule update --init --recursive
	cd vendor/projects/boxcar && $(RMAKE)
	cd vendor/projects/offline && $(RMAKE)
	cd vendor/projects/awsme && $(RMAKE)
	cd vendor/projects/awsme && $(RMAKE) cli
	bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

config/aws.yml:
	cp config/aws.yml.example config/aws.yml
