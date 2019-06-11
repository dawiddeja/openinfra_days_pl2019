#!/bin/bash
set -x

sudo ovs-vsctl del-port vm2
sudo ovs-vsctl del-port vm3

sudo ip netns del vm2
sudo ip netns del vm3
