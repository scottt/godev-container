FROM golang:1.10-alpine

# MISSING packages:
# dep   # golang dependency management tool
# goXXX # golang formatting tool
# guru  # source browsing and refactoring

RUN set -eux; \
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
	; \
	printf 'ALL ALL=(ALL) NOPASSWD: ALL\n' >> /etc/sudoers ; \
	mkdir -p /opt/godev-home/bin

COPY .bashrc /opt/godev-home
COPY .inputrc /opt/godev-home
COPY ./home-bin/* /opt/godev-home/bin/

ENTRYPOINT ["/bin/godev-entrypoint"]
WORKDIR "/home/godev"
COPY godev-entrypoint /bin
