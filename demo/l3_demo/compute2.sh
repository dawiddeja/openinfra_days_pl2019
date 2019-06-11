#!/bin/bash
set -x

#vm3
sudo ip netns add vm3
sudo ovs-vsctl add-port br-int vm3 -- set interface vm3 type=internal
sudo ip link set vm3 netns vm3

sudo ip netns exec vm3 ip link set vm3 address 1a:40:ef:2b:94:33
sudo ovs-vsctl set Interface vm3 external_ids:iface-id=ls1-vm3
sudo ip netns exec vm3 dhclient vm3

sudo ip netns exec vm3 ip addr show
sudo ip netns exec vm3 ip route show

#vm4
sudo ip netns add vm4
sudo ovs-vsctl add-port br-int vm4 -- set interface vm4 type=internal
sudo ip link set vm4 netns vm4

sudo ip netns exec vm4 ip link set vm4 address 1a:40:ef:2b:94:44
sudo ovs-vsctl set Interface vm4 external_ids:iface-id=ls2-vm4
sudo ip netns exec vm4 dhclient vm4

sudo ip netns exec vm4 ip addr show
sudo ip netns exec vm4 ip route show
