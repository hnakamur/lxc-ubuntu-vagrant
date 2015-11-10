#!/bin/sh
set -e
set -x

use_lxc_1_1=${USE_LXC_1_1:-0}
usernet_count=10

# Install apt repository for LXC version 1.1.x so that we can create CentOS 7 containers
if [ $USE_LXC_1_1 -ne 0 -a ! -f /etc/apt/sources.list.d/ubuntu-lxc-lxc-stable-trusty.list ]; then
  sudo add-apt-repository -y -s ppa:ubuntu-lxc/lxc-stable
  sudo apt-get update
fi

sudo apt-get install -y lxc

# Use dnsmasq to resolve container names on the LXC host
bridge_ip=`ip -4 -o a s lxcbr0 | sed 's/.*inet //;s|/.*||'`
if ! grep -q "^prepend domain-name-servers $bridge_ip;" /etc/dhcp/dhclient.conf; then
  sudo sed -i '/^#prepend domain-name-servers 127\.0\.0\.1;/a\
prepend domain-name-servers '$bridge_ip';' /etc/dhcp/dhclient.conf
fi

# Allow $USER to create network devices
line="$USER veth lxcbr0 $usernet_count"
if ! grep -q "^$line$" /etc/lxc/lxc-usernet; then
  sudo sh -c "echo $line >> /etc/lxc/lxc-usernet"
fi

# Create ~/.config/lxc/default.conf
lxc_config_path=/home/$USER/.config/lxc/default.conf
if [ ! -f $lxc_config_path ]; then
  mkdir -p ${lxc_config_path%/*}
  cp /etc/lxc/default.conf $lxc_config_path
  awk -F: '/^'$USER':/{print "lxc.id_map = u 0", $2, $3}' /etc/subuid >> $lxc_config_path
  awk -F: '/^'$USER':/{print "lxc.id_map = g 0", $2, $3}' /etc/subgid >> $lxc_config_path
fi
