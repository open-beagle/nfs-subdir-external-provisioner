# nfs-provisioner

<https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner>

```bash
git remote add upstream git@github.com:kubernetes-sigs/nfs-subdir-external-provisioner.git

git fetch upstream

git merge nfs-subdir-external-provisioner-4.0.18
```

## build

```bash
# cross build
docker run --rm \
  -v $PWD/:/go/src/github.com/kubernetes-sigs/nfs-subdir-external-provisioner \
  -w /go/src/github.com/kubernetes-sigs/nfs-subdir-external-provisioner \
  registry.cn-qingdao.aliyuncs.com/wod/golang:1.24-alpine \
  bash .beagle/build.sh
```
