#!/bin/bash
set -v


#Install packages
ssh ubuntu@$OVN_MANAGER -i ~/.ssh/public_os_rsa 'sudo apt-get update && \
	sudo apt-get install -y openvswitch-common \
	openvswitch-switch ovn-common ovn-host ovn-central && \
	sudo ovn-nbctl set-connection ptcp:6641 && \
	sudo ovn-sbctl set-connection ptcp:6642'

sleep 2

ssh ubuntu@$OVN_COMPUTE1 -i ~/.ssh/public_os_rsa 'sudo apt-get update && \
	sudo apt-get install -y openvswitch-common openvswitch-switch \
	ovn-common ovn-host && \
	sudo ovs-vsctl add-br br-int -- set Bridge br-int fail-mode=secure'
ssh ubuntu@$OVN_COMPUTE2 -i ~/.ssh/public_os_rsa 'sudo apt-get update && \
	sudo apt-get install -y openvswitch-common openvswitch-switch \
	ovn-common ovn-host && \
	sudo ovs-vsctl add-br br-int -- set Bridge br-int fail-mode=secure'

#Copy everything
./copy_all.sh

