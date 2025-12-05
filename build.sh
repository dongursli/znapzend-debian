#!/bin/bash
set -e

znapzend_tag=0.23.2
docker_tag=debian


podman build -t znapzendbuild --build-arg=image=$docker_tag --build-arg=znapzend-tag=$znapzend_tag .
podman run -v $PWD:/opt/workdir --rm znapzendbuild bash -c "cp /znapzend_*.deb /opt/workdir"

