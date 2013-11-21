all: ready

ready: vendor/cache
	@git submodule update --init --recursive
	@bundle check --path vendor/bundle 2>&1 >/dev/null || bundle --local --path vendor/bundle

vendor/cache:
	@bundle --path vendor/bundle
	@bundle cache
