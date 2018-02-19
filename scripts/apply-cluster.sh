#!/bin/bash

# Set up Tiller
kubectl --namespace kube-system get serviceaccount tiller &> /dev/null || kubectl --namespace kube-system create serviceaccount tiller
kubectl get clusterrolebinding tiller &> /dev/null || kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --upgrade --service-account tiller

sleep 5

helmfile sync
