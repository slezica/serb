all:
	mkdir -p lib bin
	coffee -cs < src/server.coffee > lib/server.js

	echo "#!/usr/bin/env node" > bin/serve
	coffee -csb < src/cli.coffee >> bin/serve
	chmod +x bin/serve

