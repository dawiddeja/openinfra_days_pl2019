#!/bin/bash
set -x

#create switches
sudo ovn-nbctl ls-add ls1
sudo ovn-nbctl ls-add ls2

#create router
sudo ovn-nbctl lr-add router1
sudo ovn-nbctl lrp-add router1 router1-ls1 1a:40:ef:2b:94:01 192.168.100.1/24
sudo ovn-nbctl lrp-add router1 router1-ls2 1a:40:ef:2b:94:02 192.168.200.1/24

# connect router and switches
sudo ovn-nbctl lsp-add ls1 ls1-router1
sudo ovn-nbctl lsp-set-type ls1-router1 router
sudo ovn-nbctl lsp-set-addresses ls1-router1 1a:40:ef:2b:94:01
sudo ovn-nbctl lsp-set-options ls1-router1 router-port=router1-ls1

sudo ovn-nbctl lsp-add ls2 ls2-router1
sudo ovn-nbctl lsp-set-type ls2-router1 router
sudo ovn-nbctl lsp-set-addresses ls2-router1 1a:40:ef:2b:94:02
sudo ovn-nbctl lsp-set-options ls2-router1 router-port=router1-ls2

# create logical port
sudo ovn-nbctl lsp-add ls1 ls1-vm1
sudo ovn-nbctl lsp-set-addresses ls1-vm1 "1a:40:ef:2b:94:11 192.168.100.11"
sudo ovn-nbctl lsp-set-port-security ls1-vm1 "1a:40:ef:2b:94:11 192.168.100.11"

# create logical port
sudo ovn-nbctl lsp-add ls2 ls2-vm2
sudo ovn-nbctl lsp-set-addresses ls2-vm2 "1a:40:ef:2b:94:22 192.168.200.22"
sudo ovn-nbctl lsp-set-port-security ls2-vm2 "1a:40:ef:2b:94:22 192.168.200.22"

# create logical port
sudo ovn-nbctl lsp-add ls1 ls1-vm3
sudo ovn-nbctl lsp-set-addresses ls1-vm3 "1a:40:ef:2b:94:33 192.168.100.33"
sudo ovn-nbctl lsp-set-port-security ls1-vm3 "1a:40:ef:2b:94:33 192.168.100.33"

# create logical port
sudo ovn-nbctl lsp-add ls2 ls2-vm4
sudo ovn-nbctl lsp-set-addresses ls2-vm4 "1a:40:ef:2b:94:44 192.168.200.44"
sudo ovn-nbctl lsp-set-port-security ls2-vm4 "1a:40:ef:2b:94:44 192.168.200.44"

sudo ovn-nbctl show
