#!/bin/bash

export VSPHERE_NETWORK=tkg-03
export VSPHERE_RESOURCE_POOL="/SDDC-Datacenter/host/Cluster-1/Resources/Compute-ResourcePool/tenant-3/tkg-cluster-5"

tkg create cluster tkg-cluster-5 -p dev -k v1.17.3+vmware.2 -c 1 -w 3
