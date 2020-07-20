#!/bin/bash

export VSPHERE_NETWORK=tkg-01
export VSPHERE_RESOURCE_POOL="/SDDC-Datacenter/host/Cluster-1/Resources/Compute-ResourcePool/tkg-cluster-2"

tkg create cluster tkg-cluster-2 -p dev -k v1.17.3+vmware.2 -c 1 -w 4
