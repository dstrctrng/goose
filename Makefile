GOOSE := $(PWD)
BOXCAR := $(GOOSE)
AWSME := $(GOOSE)
AWSME_CLI := $(GOOSE)/vendor/projects/awsme_cli
PROVIDER := virtualbox

export GOOSE BOXCAR AWSME AWSME_CLI

all: ready

ready: config/aws.yml
	git submodule update --init --recursive
	cd vendor/projects/boxcar && $(MAKE)
	cd vendor/projects/offline && $(MAKE)
	cd vendor/projects/awsme && $(MAKE)
	cd vendor/projects/awsme && $(MAKE) cli
	bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

config/aws.yml:
	cp config/aws.yml.example config/aws.yml
