FROM golang:1.10-alpine

# MISSING packages:
# dep   # golang dependency management tool
# goXXX # golang formatting tool
# guru  # source browsing and refactoring

RUN set -eux; \
	printf 'ALL ALL=(ALL) NOPASSWD: ALL\n' >> /etc/sudoers ; \
	mkdir -p /opt/godev-home/bin ; \
	apk add python3 \
		sudo \
		bash \
		make \
		git \
		gcc \
		gdb \
		musl-dev \
		strace \
		ltrace \
	;

COPY .bashrc /opt/godev-home
COPY .inputrc /opt/godev-home
# FIXME: preserve symlinks
COPY ./home-bin/* /opt/godev-home/bin/

RUN mkdir -p /usr/local/gotools/bin
# FIXME: preserve symlinks
COPY gotools-bin/* /usr/local/gotools/bin/
RUN /usr/local/gotools/bin/gotour-install  /usr/local/gotools && \
    /usr/local/gotools/bin/godoc-install   /usr/local/gotools && \
    /usr/local/gotools/bin/gotools-install /usr/local/gotools

ENTRYPOINT ["/bin/godev-entrypoint"]
WORKDIR "/home/godev"
COPY godev-entrypoint /bin
