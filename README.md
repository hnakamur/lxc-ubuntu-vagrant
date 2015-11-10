lxc-ubuntu-vagrant
==================

An example for installing LXC version 1.1.x and creating unprivileged containers on Ubuntu Vagrant box.

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
vagrant@vagrant-ubuntu-trusty-64:~$ lxc-info --version
1.1.5
vagrant@vagrant-ubuntu-trusty-64:~$ lxc-create -n dummy -t download -- --list
Setting up the GPG keyring
Downloading the image index

---
DIST    RELEASE ARCH    VARIANT BUILD
---
centos  6       amd64   default 20151110_02:16
centos  6       i386    default 20151110_02:16
centos  7       amd64   default 20151110_02:16
debian  jessie  amd64   default 20151109_22:42
debian  jessie  armel   default 20151109_22:42
debian  jessie  armhf   default 20151109_22:42
debian  jessie  i386    default 20151109_22:42
debian  sid     amd64   default 20151109_22:42
debian  sid     armel   default 20151109_22:42
debian  sid     armhf   default 20151109_22:42
debian  sid     i386    default 20151109_22:42
debian  squeeze amd64   default 20151109_22:42
debian  squeeze armel   default 20150826_22:42
debian  squeeze i386    default 20151109_22:42
debian  wheezy  amd64   default 20151109_22:42
debian  wheezy  armel   default 20151109_22:42
debian  wheezy  armhf   default 20151109_22:42
debian  wheezy  i386    default 20151109_22:42
gentoo  current amd64   default 20151110_14:12
gentoo  current armhf   default 20151110_14:12
gentoo  current i386    default 20151110_14:12
oracle  6.5     amd64   default 20151110_11:40
oracle  6.5     i386    default 20151110_11:40
plamo   5.x     amd64   default 20151109_21:36
plamo   5.x     i386    default 20151109_21:36
ubuntu  precise amd64   default 20151110_03:49
ubuntu  precise armel   default 20151110_03:49
ubuntu  precise armhf   default 20151110_03:49
ubuntu  precise i386    default 20151110_03:49
ubuntu  trusty  amd64   default 20151110_03:49
ubuntu  trusty  arm64   default 20150604_03:49
ubuntu  trusty  armhf   default 20151110_03:49
ubuntu  trusty  i386    default 20151110_03:49
ubuntu  trusty  ppc64el default 20151110_03:49
ubuntu  vivid   amd64   default 20151110_03:49
ubuntu  vivid   arm64   default 20150604_03:49
ubuntu  vivid   armhf   default 20151110_03:49
ubuntu  vivid   i386    default 20151110_03:49
ubuntu  vivid   ppc64el default 20151110_03:49
ubuntu  wily    amd64   default 20151110_19:36
ubuntu  wily    arm64   default 20150604_03:49
ubuntu  wily    armhf   default 20151110_03:49
ubuntu  wily    i386    default 20151110_03:49
ubuntu  wily    ppc64el default 20151110_03:49
ubuntu  xenial  amd64   default 20151110_19:36
ubuntu  xenial  armhf   default 20151110_19:36
ubuntu  xenial  i386    default 20151110_19:36
---
lxc-create: lxccontainer.c: create_run_template: 1201 container creation template for dummy failed
lxc-create: lxc_create.c: main: 274 Error creating container dummy
```

## License
MIT
