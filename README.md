lxc-ubuntu-vagrant
==================

An example for installing LXC and creating unprivileged containers on Ubuntu Vagrant box.

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

## License
MIT
