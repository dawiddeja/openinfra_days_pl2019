#!/bin/bash
set -x

sudo ovn-nbctl lsp-del ls1-vm1
sudo ovn-nbctl lsp-del ls1-vm3
sudo ovn-nbctl lsp-del ls2-vm2
sudo ovn-nbctl lsp-del ls2-vm4
sudo ovn-nbctl lsp-del ls1-router1
sudo ovn-nbctl lsp-del ls2-router1
sudo ovn-nbctl ls-del ls1
sudo ovn-nbctl ls-del ls2
sudo ovn-nbctl lrp-del router1-ls1
sudo ovn-nbctl lrp-del router1-ls2
sudo ovn-nbctl lr-del router1
