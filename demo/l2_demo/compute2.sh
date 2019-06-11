#!/bin/bash
set -x

#vm3
sudo ip netns add vm3
sudo ovs-vsctl add-port br-int vm3 -- set interface vm3 type=internal
sudo ip link set vm3 netns vm3

sudo ip netns exec vm3 ip link set vm3 address 1a:40:ef:2b:94:33
sudo ip netns exec vm3 ip addr add 192.168.100.33/24 dev vm3
sudo ip netns exec vm3 ip link set vm3 up
sudo ovs-vsctl set Interface vm3 external_ids:iface-id=ls1-vm3

sudo ip netns exec vm3 ip addr show
