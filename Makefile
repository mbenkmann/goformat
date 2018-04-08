GOPATH:=$(CURDIR)
export GOPATH

all: build

build:
	go build goformat/goformat

clean:
	rm -f goformat

