#!/bin/bash
set -ex

sudo apt-get update -qq
sudo apt-get install -y bash bats iproute2 iputils-ping ansible-lint yamllint

# vim:sw=2:ts=2:et:
