FROM jonaseck/rpi-raspbian-libcec-py

WORKDIR /go/src/github.com/dmowcomber/hdmi-cec-homekit

# setup Golang
ENV GO_VERSION 1.8
RUN mkdir -p /usr/local/go \
	&& curl -SLO "http://resin-packages.s3.amazonaws.com/golang/v$GO_VERSION/go$GO_VERSION.linux-armv7hf.tar.gz" \
	&& echo "3a70cfa425cd09b0e549640a483f3c0d034269a2bfc3f47da7f373d16cfe4aa8  go1.8.linux-armv7hf.tar.gz" | sha256sum -c - \
	&& tar -xzf "go$GO_VERSION.linux-armv7hf.tar.gz" -C /usr/local/go --strip-components=1 \
	&& rm -f go$GO_VERSION.linux-armv7hf.tar.gz
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
