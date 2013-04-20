all: build

clean:
	rm -rf lib bin node_modules

build:
	mkdir -p lib bin
	coffee -cs < src/server.coffee > lib/server.js

	echo "#!/usr/bin/env node" > bin/serb
	coffee -csb < src/cli.coffee >> bin/serb
	chmod +x bin/serb

run: build
	bin/serb -d

dist: clean build

publish: dist
	npm publish
