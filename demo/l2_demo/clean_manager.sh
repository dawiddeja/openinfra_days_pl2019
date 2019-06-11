#!/bin/bash
set -x

sudo ovn-nbctl lsp-del ls1-vm1
sudo ovn-nbctl lsp-del ls1-vm2
sudo ovn-nbctl lsp-del ls1-vm3

sudo ovn-nbctl ls-del ls1
sudo ovn-nbctl show
