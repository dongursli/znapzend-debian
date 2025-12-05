ARG image=debian:latest
ARG znapzend-tag=v0.23.2

FROM ${image}

RUN apt-get update && apt-get install -y git devscripts debhelper unzip build-essential
RUN git clone -b v0.23.2 https://github.com/oetiker/znapzend

RUN rm -rf znapzend/debian
COPY debian znapzend/debian

RUN cd znapzend && debuild --no-tgz-check -us -uc
