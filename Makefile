GOOSE := $(PWD)
BOXCAR := $(GOOSE)

export GOOSE BOXCAR

RMAKE := unset BUNDLE_GEMFILE BUNDLE_BIN_PATH GEM_HOME GEM_PATH _ORIGINAL_GEM_PATH && $(MAKE)

all:
	$(MAKE) git
	$(MAKE) projects
	$(MAKE) ruby

git:
	git submodule update --init --recursive

projects:
	cd vendor/projects/boxcar && $(RMAKE)

ruby:
	bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

