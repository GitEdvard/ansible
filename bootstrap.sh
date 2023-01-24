#!/usr/bin/env bash

sudo apt update
sudo apt install ansible
ansible-galaxy collection install community.general
