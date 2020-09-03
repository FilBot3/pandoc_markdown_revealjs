download-revealjs:
	mkdir -p lib
	curl \
		--output lib/3.9.2.tar.gz \
		--progress-bar \
		--location \
		--url "https://github.com/hakimel/reveal.js/archive/3.9.2.tar.gz"
	tar -zxf lib/3.9.2.tar.gz
	mv reveal.js-3.9.2 reveal.js
	curl \
		--output lib/reveal.js-plugins-3.9.0.tar.gz \
		--progress-bar \
		--location \
		--url "https://github.com/rajgoel/reveal.js-plugins/archive/3.9.0.tar.gz"
	tar -zxf lib/reveal.js-plugins-3.9.0.tar.gz -C lib/
	mv lib/reveal.js-plugins-3.9.0/chalkboard reveal.js/plugin/

# https://pandoc.org/
build:
	pandoc \
		--self-contained \
		--to=revealjs \
		--output=dist/index.html \
		--slide-level=2 \
		--resource-path=.:src \
		--variable="theme=black" \
		src/title.yml \
		src/slides.md

# https://docs.python.org/3/library/http.server.html
http:
	python -m http.server --directory=dist

