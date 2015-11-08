#!/bin/sh
set -e
set -x

lxc-create -n trusty ct -t download -- -d ubuntu -r trusty -a amd64
lxc-start -dn trusty
lxc-create -n cent7 ct -t download -- -d centos -r 7 -a amd64
lxc-start -dn cent7
lxc-create -n cent6 ct -t download -- -d centos -r 6 -a amd64
lxc-start -dn cent6
