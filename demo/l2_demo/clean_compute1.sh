#!/bin/bash
set -x

sudo ovs-vsctl del-port vm1
sudo ip netns del vm1
sudo ovs-vsctl del-port vm2
sudo ip netns del vm2
