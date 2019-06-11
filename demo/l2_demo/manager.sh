#!/bin/bash
set -x

sudo ovn-nbctl ls-add ls1

# create logical port
sudo ovn-nbctl lsp-add ls1 ls1-vm1
sudo ovn-nbctl lsp-set-addresses ls1-vm1 1a:40:ef:2b:94:11
sudo ovn-nbctl lsp-set-port-security ls1-vm1 1a:40:ef:2b:94:11

# create logical port
sudo ovn-nbctl lsp-add ls1 ls1-vm2
sudo ovn-nbctl lsp-set-addresses ls1-vm2 1a:40:ef:2b:94:22
sudo ovn-nbctl lsp-set-port-security ls1-vm2 1a:40:ef:2b:94:22

# create logical port
sudo ovn-nbctl lsp-add ls1 ls1-vm3
sudo ovn-nbctl lsp-set-addresses ls1-vm3 1a:40:ef:2b:94:33
sudo ovn-nbctl lsp-set-port-security ls1-vm3 1a:40:ef:2b:94:33

sudo ovn-nbctl show
