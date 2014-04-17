COFFEE='coffee'

all: build


lib/%.js: src/%.coffee
	@mkdir -p lib
	coffee -cs < $? > $@


build: lib/server.js lib/cli.js

clean:
	rm -rf lib

run: build
	bin/serb -d

dist: clean build

install:
	npm install -g

publish: dist
	npm publish
