GOOSE := $(PWD)
BOXCAR := $(GOOSE)

export GOOSE BOXCAR

RMAKE := unset BUNDLE_GEMFILE BUNDLE_BIN_PATH GEM_HOME GEM_PATH _ORIGINAL_GEM_PATH && $(MAKE)

all:
	$(MAKE) git
	$(MAKE) projects
	$(MAKE) ruby
	$(MAKE) python
	$(MAKE) jq

git:
	git submodule update --init --recursive

projects:
	cd vendor/projects/boxcar && $(RMAKE)

ruby:
	bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

python: bin/python

bin/python:
	env PATH=$(PATH):/usr/local/bin bin/puddle init
	env PATH=$(PATH):/usr/local/bin bin/puddle install

jq: bin/jq

bin/jq: bin/python
	git submodule update --init --recursive
	cd vendor/projects/jq && libtoolize
	cd vendor/projects/jq && aclocal
	cd vendor/projects/jq && autoreconf -i
	cd vendor/projects/jq && ./configure
	cd vendor/projects/jq && make
	mv vendor/projects/jq/jq bin/jq
	source bin/activate && cd vendor/projects/jq.py && python setup.py install
