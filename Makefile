GOOSE := $(PWD)
BOXCAR := $(GOOSE)

export GOOSE BOXCAR

RMAKE := unset BUNDLE_GEMFILE BUNDLE_BIN_PATH GEM_HOME GEM_PATH _ORIGINAL_GEM_PATH && $(MAKE)

all: ready

ready: bin/jq bin/python
	git submodule update --init --recursive
	cd vendor/projects/boxcar && $(RMAKE)
	cd vendor/projects/offline && $(RMAKE)
	bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

bin/python:
	bin/puddle init
	bin/puddle install

bin/jq:
	git submodule update --init --recursive
	cd vendor/projects/jq && libtoolize
	cd vendor/projects/jq && aclocal
	cd vendor/projects/jq && autoreconf -i
	cd vendor/projects/jq && ./configure
	cd vendor/projects/jq && make
	mv vendor/projects/jq/jq bin/jq
	cd vendor/projects/jq.py && python setup.py install
