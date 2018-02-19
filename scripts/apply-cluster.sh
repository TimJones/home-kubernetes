#!/bin/bash

# Set up Tiller
kubectl --namespace kube-system get serviceaccount tiller &> /dev/null || kubectl --namespace kube-system create serviceaccount tiller
kubectl get clusterrolebinding tiller &> /dev/null || kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --upgrade --service-account tiller

# Wait for Tiller to be up-to-date
echo -n "Waiting for tiller to be ready"
until [ "$(kubectl --namespace kube-system get deployment tiller-deploy -o jsonpath='{.status.availableReplicas}')" == "1" ]; do
  echo -n "."
  sleep 5
done

helmfile sync
