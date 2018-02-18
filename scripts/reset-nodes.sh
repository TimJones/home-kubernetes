#!/bin/bash

if [ $# -eq 0 ]; then
  cat <<EOU
Quick node resetter
Usage: $(basename "$0") node [node]...

node:  Name of node to reset, must be reachable by SSH

Example:
$(basename "$0") node-01.home.example.local
EOU
  exit 1
fi

for node in "$@"; do
  ssh -o StrictHostKeyChecking=no core@${node} 'sudo dd if=/dev/zero of=/dev/sda bs=512 count=1 && sudo systemctl reboot'
  ssh-keygen -R ${node}
done
