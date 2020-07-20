#!/bin/bash

set -euo pipefail

kubectl config use-context tkg-cluster-2-admin@tkg-cluster-2

kubectl apply -f ~/tkg/storageclass.yaml
kubectl create ns metallb-system
kubectl apply -f ~/tkg/metallb.yaml -n metallb-system
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ~/tkg/metallb-configmap-2.yaml
kubectl apply -f ~/tkg/contour.yaml
