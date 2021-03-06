FROM ubuntu:bionic-20200403

ENV RUBY_VERSION 2.5
ENV VARNISH_APT_KEY A0378A38E4EACA3660789E570BAC19E3F6C90CD5

ENV GOLANG_VERSION 1.14.2
ENV GOLANG_SHA256 6272d6e940ecb71ea5636ddb5fab3933e087c1356173c61f4a803895e947ebb3

RUN apt-get update && apt-get install -y \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
		"ruby${RUBY_VERSION}" \
		"ruby${RUBY_VERSION}-dev" \
		build-essential \
		curl \
		apt-transport-https \
		ca-certificates \
		lsb-release \
		git-core \
		unzip \
		zip \
		autotools-dev \
		autoconf \
		docutils-common \
		libtool

# add extra apt repos

# official varnish apt repo
RUN export GNUPGHOME="$(mktemp -d)" && \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys $VARNISH_APT_KEY && \
    gpg --batch --export export $VARNISH_APT_KEY > /etc/apt/trusted.gpg.d/varnish.gpg && \
    gpgconf --kill all && \
    echo deb https://packagecloud.io/varnishcache/varnish66/ubuntu/ bionic main > /etc/apt/sources.list.d/varnish.list

# run final apt update after setting up all apt repos
RUN apt-get update

# install golang
RUN curl -sSL --output go.tgz https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    echo "${GOLANG_SHA256} *go.tgz" | sha256sum -c - && \
    tar -C /usr/local -xzf go.tgz && \
    rm go.tgz && \
    export PATH="/usr/local/go/bin:$PATH" && \
    go version

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN gem install fpm-cookery --no-ri --no-rdoc

RUN mkdir /app
COPY entrypoint.sh /app/entrypoint.sh

# entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
