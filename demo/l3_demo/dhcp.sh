#!/bin/bash
set -x

#create DHCP
ls1Dhcp="$(sudo ovn-nbctl create DHCP_Options cidr=192.168.100.0/24 \
	options="\"server_id\"=\"192.168.100.1\" \"server_mac\"=\"1a:40:ef:2b:94:01\" \
	\"lease_time\"=\"3600\" \"router\"=\"192.168.100.1\"")" 
echo $ls1Dhcp

ls2Dhcp="$(sudo ovn-nbctl create DHCP_Options cidr=192.168.200.0/24 \
	options="\"server_id\"=\"192.168.200.1\" \"server_mac\"=\"1a:40:ef:2b:94:02\" \
	\"lease_time\"=\"3600\" \"router\"=\"192.168.200.1\"")"
echo $ls2Dhcp

sudo ovn-nbctl dhcp-options-list

sudo ovn-nbctl lsp-set-dhcpv4-options ls1-vm1 $ls1Dhcp
sudo ovn-nbctl lsp-get-dhcpv4-options ls1-vm1

sudo ovn-nbctl lsp-set-dhcpv4-options ls1-vm3 $ls1Dhcp
sudo ovn-nbctl lsp-get-dhcpv4-options ls1-vm3

sudo ovn-nbctl lsp-set-dhcpv4-options ls2-vm2 $ls2Dhcp
sudo ovn-nbctl lsp-get-dhcpv4-options ls2-vm2

sudo ovn-nbctl lsp-set-dhcpv4-options ls2-vm4 $ls2Dhcp
sudo ovn-nbctl lsp-get-dhcpv4-options ls2-vm4
