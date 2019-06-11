#!/bin/bash
set -x

#vm1
sudo ip netns add vm1
sudo ovs-vsctl add-port br-int vm1 -- set interface vm1 type=internal
sudo ip link set vm1 netns vm1

sudo ip netns exec vm1 ip link set vm1 address 1a:40:ef:2b:94:11
sudo ovs-vsctl set Interface vm1 external_ids:iface-id=ls1-vm1
sudo ip netns exec vm1 dhclient vm1

sudo ip netns exec vm1 ip addr show
sudo ip netns exec vm1 ip route show

#vm2
sudo ip netns add vm2
sudo ovs-vsctl add-port br-int vm2 -- set interface vm2 type=internal
sudo ip link set vm2 netns vm2

sudo ip netns exec vm2 ip link set vm2 address 1a:40:ef:2b:94:22
sudo ovs-vsctl set Interface vm2 external_ids:iface-id=ls2-vm2
sudo ip netns exec vm2 dhclient vm2

sudo ip netns exec vm2 ip addr show
sudo ip netns exec vm2 ip route show
