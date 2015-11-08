lxc-ubuntu-vagrant
==================

An example for installing LXC LTS (long time support) version 1.0.x and creating unprivileged containers on Ubuntu Vagrant box.

## Usage

You need to run

```
vagrant up && vagrant reload --provision
```

instead of just

```
vagrant up
```

The reason is the reboot is needed after installing cgmanager before creating containers.
See https://linuxcontainers.org/ja/lxc/getting-started/

## Download template lists

You can see download template lists with the following command.

```
$ lxc-create -n dummy -t download -- --list
Setting up the GPG keyring
Downloading the image index

---
DIST    RELEASE ARCH    VARIANT BUILD
---
centos  6       amd64   default 20151108_02:16
centos  6       i386    default 20151108_02:16
debian  wheezy  amd64   default 20151107_22:42
debian  wheezy  armel   default 20151107_22:42
debian  wheezy  armhf   default 20151107_22:42
debian  wheezy  i386    default 20151107_22:42
gentoo  current amd64   default 20151107_14:12
gentoo  current armhf   default 20151107_14:12
gentoo  current i386    default 20151107_14:12
oracle  6.5     amd64   default 20151108_11:40
oracle  6.5     i386    default 20151108_11:40
plamo   5.x     amd64   default 20151107_21:36
plamo   5.x     i386    default 20151107_21:36
ubuntu  precise amd64   default 20151107_03:49
ubuntu  precise armel   default 20151107_03:49
ubuntu  precise armhf   default 20151108_03:49
ubuntu  precise i386    default 20151108_03:49
ubuntu  trusty  amd64   default 20151108_03:49
ubuntu  trusty  arm64   default 20150604_03:49
ubuntu  trusty  armhf   default 20151108_03:49
ubuntu  trusty  i386    default 20151108_03:49
ubuntu  trusty  ppc64el default 20151108_03:49
---
lxc_container: lxccontainer.c: create_run_template: 1125 container creation
template for dummy failed
lxc_container: lxc_create.c: main: 271 Error creating container dummy
```

## License
MIT
