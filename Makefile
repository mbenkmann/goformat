GOPATH:=$(CURDIR)
export GOPATH

all: build

build:
	go install goformat/goformat

clean:
	rm -f goformat

