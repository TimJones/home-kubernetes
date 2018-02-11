#!/bin/bash

if [ $# -eq 0 ]; then
  cat <<EOU
Windows Subsystem for Linux & Docker Compose workaround
Usage: $(basename "$0") dest [dc-args]..

dest:     Destination path in Windows filesystem from WSL
dc-args:  Any additional args will be forwarded to docker-compose

Example:
$(basename "$0") /c/Users/Tim/Projects/home-kubernetes-strap up -d
EOU
  exit 1
fi

dest=$1; shift

# First directory in WSL is 'drive' in W10, and what gets shared
# to Docker-for-Windows, so needs to be a direct drive mount
drive_dir="${dest}"
while [ "$(dirname "${drive_dir}")" != "/" ]; do
drive_dir="$(dirname "${drive_dir}")"
done
if ! mountpoint -q "${drive_dir}"; then
echo "ERR: No mountpoint at '${drive_dir}' found"
echo "Docker for Windows exports entire drives and mounts them at '/<drive-letter>'"
echo "You probably need to run something like 'sudo mount --bind /mnt${drive_dir} ${drive_dir}'"
exit 2
fi

rsync -aqr ${PWD}/ ${dest}/ --delete

if [  $# -gt 0 ]; then
  pushd ${dest}
  docker-compose $@
  popd
fi
