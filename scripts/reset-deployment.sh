#!/bin/bash

if [ -f "terraform.tfstate" ]; then
  for resource in bootkube-start copy-etcd-secrets copy-kubeconfig.0 copy-kubeconfig.1; do
    terraform taint -module cluster null_resource.${resource}
  done

  ${0%/*}/reset-nodes.sh node-{01..03}.home.es.tnv

  terraform apply -auto-approve
fi
