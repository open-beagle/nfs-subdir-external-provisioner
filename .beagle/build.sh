#!/bin/sh

export CGO_ENABLED=0

set -ex

# 版本信息
BUILD_VERSION="${BUILD_VERSION:-dev}"
GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
BUILD_DATE=$(date -u '+%Y-%m-%d_%H:%M:%S')

# 构建 ldflags
LDFLAGS="-s -w -X main.version=${BUILD_VERSION} -X main.gitCommit=${GIT_COMMIT} -X main.buildDate=${BUILD_DATE}"

export GOARCH=amd64
go build -ldflags "${LDFLAGS}" -o release/linux/${GOARCH}/nfs-provisioner ./cmd/nfs-subdir-external-provisioner

export GOARCH=arm64
go build -ldflags "${LDFLAGS}" -o release/linux/${GOARCH}/nfs-provisioner ./cmd/nfs-subdir-external-provisioner
