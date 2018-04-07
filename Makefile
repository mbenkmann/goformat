GOPATH:=$(CURDIR)
export GOPATH

all: build

build:
	go build ./src/cmd/goformat

clean:
	rm -f goformat

