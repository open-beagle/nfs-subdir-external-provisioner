# nfs-provisioner

<https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner>

```bash
git remote add upstream git@github.com:kubernetes-sigs/nfs-subdir-external-provisioner.git

git fetch upstream

git merge nfs-subdir-external-provisioner-4.0.17
```

## build

```bash
# cache
docker run -it --rm \
-v $PWD/:/go/src/github.com/kubernetes-sigs/nfs-subdir-external-provisioner \
-w /go/src/github.com/kubernetes-sigs/nfs-subdir-external-provisioner \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.19-loongnix \
rm -rf vendor && go mod vendor

# cross build
docker run -it --rm \
-v $PWD/:/go/src/github.com/kubernetes-sigs/nfs-subdir-external-provisioner \
-w /go/src/github.com/kubernetes-sigs/nfs-subdir-external-provisioner \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.19-loongnix \
bash .beagle/build.sh
```

## cache

```bash
# 构建缓存-->推送缓存至服务器
docker run --rm \
  -e PLUGIN_REBUILD=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="nfs-subdir-external-provisioner" \
  -e PLUGIN_MOUNT="./.git" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0

# 读取缓存-->将缓存从服务器拉取到本地
docker run --rm \
  -e PLUGIN_RESTORE=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="nfs-subdir-external-provisioner" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0
```
