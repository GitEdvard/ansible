#!/usr/bin/env bash

sudo apt update
sudo apt install ansible -y
ansible-galaxy collection install community.general
