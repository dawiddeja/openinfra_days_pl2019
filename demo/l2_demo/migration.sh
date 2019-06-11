#!/bin/bash
set -x

#vm2
sudo ip netns add vm2
sudo ovs-vsctl add-port br-int vm2 -- set interface vm2 type=internal
sudo ip link set vm2 netns vm2

sudo ip netns exec vm2 ip link set vm2 address 1a:40:ef:2b:94:22
sudo ip netns exec vm2 ip addr add 192.168.100.22/24 dev vm2
sudo ip netns exec vm2 ip link set vm2 up
echo 'Next command is sudo ovs-vsctl set Interface vm2 external_ids:iface-id=ls1-vm2'
read -p "Press enter to switch logical port"
sudo ovs-vsctl set Interface vm2 external_ids:iface-id=ls1-vm2
