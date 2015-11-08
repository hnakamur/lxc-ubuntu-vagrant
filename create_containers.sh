#!/bin/sh
set -e
set -x

for ct in ct01 ct02; do
  lxc-create -n $ct -t download -- -d ubuntu -r trusty -a amd64
  lxc-start -dn $ct
done
