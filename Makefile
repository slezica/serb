all: clean build

clean:
	rm -rf lib bin

build:
	mkdir -p lib bin
	coffee -cs < src/server.coffee > lib/server.js

	echo "#!/usr/bin/env node" > bin/serf
	coffee -csb < src/cli.coffee >> bin/serf
	chmod +x bin/serf

