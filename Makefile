all: clean build

clean:
	rm -rf lib bin

build:
	mkdir -p lib bin
	coffee -cs < src/server.coffee > lib/server.js

	echo "#!/usr/bin/env node" > bin/serb
	coffee -csb < src/cli.coffee >> bin/serb
	chmod +x bin/serb

