#!/bin/bash

cd `git rev-parse --show-toplevel`/provisioning/roles/elk_cluster
ansible-playbook main.yml