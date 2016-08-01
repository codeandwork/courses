build:
	tools/build.sh

clean:
	rm -f web/*

dist: build
	test -d web
	tools/cli-deploy.sh
