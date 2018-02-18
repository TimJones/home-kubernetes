#!/bin/bash

if [ $# -eq 0 ]; then
  cat <<EOU
Kubernetes deploymnet resetter
Usage: $(basename "$0") cluster

cluster:  Name of Kubernetes cluster to reset, nodes must be reachable by SSH

Example:
$(basename "$0") home
EOU
  exit 1
fi

cluster="${1}"

terraform plan

for resource in $(terraform show -no-color | awk -F'\\.|:' -v regex='module.'"${cluster}"'.null_resource.(bootkube-start|copy-etcd-secrets|copy-kubeconfig)' '$0 ~ regex { print NF == 6 ? $4 "." $5 : $4 }'); do
  terraform taint -module ${cluster} null_resource.${resource}
done

for node in $(terraform show -no-color | awk '$1 == "vars.domain_name" { print $3 }'); do
  ${0%/*}/reset-nodes.sh ${node}
done

terraform apply -auto-approve
