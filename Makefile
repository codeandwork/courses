build:
	sh tools/build.sh

clean:
	rm -f web/*

dist: build
	test -d web
	sh tools/cli-deploy.sh
