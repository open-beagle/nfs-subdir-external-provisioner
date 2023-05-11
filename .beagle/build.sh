#!/bin/sh

export CGO_ENABLED=0

set -ex

export GOARCH=amd64
go build -ldflags "-s -w" -o release/linux/${GOARCH}/nfs-provisioner ./cmd/nfs-subdir-external-provisioner

export GOARCH=arm64
go build -ldflags "-s -w" -o release/linux/${GOARCH}/nfs-provisioner ./cmd/nfs-subdir-external-provisioner

export GOARCH=ppc64le
go build -ldflags "-s -w" -o release/linux/${GOARCH}/nfs-provisioner ./cmd/nfs-subdir-external-provisioner

export GOARCH=mips64le
go build -ldflags "-s -w" -o release/linux/${GOARCH}/nfs-provisioner ./cmd/nfs-subdir-external-provisioner

# error
# export GOARCH=loong64
# go build -ldflags "-s -w" -o release/linux/${GOARCH}/nfs-provisioner ./cmd/nfs-subdir-external-provisioner
