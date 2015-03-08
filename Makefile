TOOLCHAIN := toolchain
BUILDDIR := builds
JRUBYGET := https://s3.amazonaws.com/jruby.org/downloads/1.7.19/jruby-complete-1.7.19.jar
JRUBY := ${TOOLCHAIN}/jruby-complete.jar
VERSION := 1.0

.PHONY: all clean distribute
all: js css build

js: ${BUILDDIR}
	mkdir -p ${BUILDDIR}/javascript
	java -jar ${TOOLCHAIN}/compressor.jar -o javascript/jtab.jquery.min.js javascript/jtab.jquery.js && \
	cp javascript/jtab.jquery.min.js ${BUILDDIR}/javascript/jtab.jquery.min.js

css: ${BUILDDIR}
	mkdir -p ${BUILDDIR}/stylesheets
	java -jar ${JRUBY} -S compass compile --app-dir=. --sass-dir=stylesheets --images-dir=images --output-style=compressed && \
	java -jar ${TOOLCHAIN}/compressor.jar -o stylesheets/jtab.min.css stylesheets/jtab.css && \
	cp stylesheets/jtab.min.css ${BUILDDIR}/stylesheets/jtab.min.css && \
	rm stylesheets/jtab.css

$(BUILDDIR): ${TOOLCHAIN}
	mkdir -p ${BUILDDIR}

$(TOOLCHAIN):
	mkdir -p ${TOOLCHAIN}
	wget ${JRUBYGET} && mv jruby-complete-1.7.19.jar ${JRUBY} && \
	java -jar ${JRUBY} -S gem install -i ${TOOLCHAIN}/gems shared sass compass yuicompressor --no-rdoc --no-ri && \
	jar uf ${JRUBY} -C ${TOOLCHAIN}/gems . && \
	cp ${TOOLCHAIN}/gems/gems/*compressor*/lib/*compressor*.jar ${TOOLCHAIN}/compressor.jar

build: ${BUILDDIR}
	cp LICENSE ${BUILDDIR}
	cp README.md ${BUILDDIR}
	cd ${BUILDDIR} && zip -r jtab-${VERSION}.zip ./ && mv jtab-${VERSION}.zip ../

clean:
	rm -rf ${BUILDDIR}
	rm -rf ${TOOLCHAIN}
	rm -f jtab-${VERSION}.zip

