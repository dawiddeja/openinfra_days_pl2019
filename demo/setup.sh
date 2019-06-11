#!/bin/bash
source ~/demo/ips.sh
set -x

sudo dhclient ens4
MY_IP=`ip a l ens4 | awk '/inet /{print $2}' | cut -f1 -d '/'`

sudo ovs-vsctl set open . external-ids:ovn-remote=tcp:$OVN_MANAGER_PRIV:6642
sudo ovs-vsctl set open . external-ids:ovn-encap-type=geneve
sudo ovs-vsctl set open . external-ids:ovn-encap-ip=$MY_IP
