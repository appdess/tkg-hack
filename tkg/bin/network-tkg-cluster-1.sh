#!/bin/bash

set -euo pipefail

kubectl config use-context tkg-cluster-1-admin@tkg-cluster-1

kubectl apply -f ~/tkg/storageclass.yaml
kubectl create ns metallb-system
kubectl apply -f ~/tkg/metallb.yaml -n metallb-system
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ~/tkg/metallb-configmap-1.yaml
kubectl apply -f ~/tkg/contour.yaml
