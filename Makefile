GOPATH:=$(CURDIR)
export GOPATH

all: goformat

goformat:
	go build ./src/cmd/goformat

clean:
	rm -f goformat

