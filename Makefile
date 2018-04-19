GOPATH:=$(CURDIR)
export GOPATH

all: build

build:
	go install winterdrache.de/goformat/goformat

clean:
	rm -f bin/goformat bin/debug-temp

distclean:
	rm -rf pkg/* bin/*
	find -name "*~" -exec rm {} ';'
